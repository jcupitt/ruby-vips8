
module Vips

    # internal call entry ... see Vips::call for the public entry point
    private
    def self.call_base(name, instance, option_string, supplied_values)
        log "in Vips::call_base"
        log "name = #{name}"
        log "instance = #{instance}"
        log "option_string = #{option_string}"
        log "supplied_values are:"
        supplied_values.each {|x| log "   #{x}"}

        if supplied_values.last.is_a? Hash
            optional_values = supplied_values.last
            supplied_values.delete_at -1
        else
            optional_values = {}
        end

        begin
            op = Vips::Operation.new name
        rescue
            raise Vips::Error, "no operator '#{name}'"
        end

        # set string options first 
        log "setting string options ..."
        if option_string
            if op.set_from_string(option_string) != 0
                raise Error
            end
        end

        all_args = op.get_args

        # the instance, if supplied, must be a vips image ... we use it for
        # match_image, below
        if instance and not instance.is_a? Vips::Image
            raise Vips::Error, "@instance is not a Vips::Image."
        end

        # if the op needs images but the user supplies constants, we expand
        # them to match the first input image argument ... find the first
        # image
        log "searching for first image argument ..."
        match_image = instance
        if match_image == nil
            match_image = supplied_values.find {|x| x.is_a? Vips::Image}
        end
        if match_image == nil
            match = optional_values.find do |name, value|
                value.is_a? Vips::Image
            end
            # if we found a match, it'll be [name, value]
            if match
                match_image = match[1]
            end
        end

        # find unassigned required input args
        log "finding unassigned required input arguments ..."
        required_input = all_args.select do |arg|
            not arg.isset and
            (arg.flags & :input) != 0 and
            (arg.flags & :required) != 0 
        end

        # do we have a non-nil instance? set the first image arg with this
        log "setting first image arg with instance ..."
        if instance != nil
            x = required_input.find do |x|
                x.prop.value_type.type_is_a? GLib::Type["VipsImage"]
            end
            if x == nil
                raise Vips::Error, 
                    "No #{instance.class} argument to #{name}."
            end
            x.set_value match_image, instance
            required_input.delete x
        end

        if required_input.length != supplied_values.length
            raise Vips::Error, 
                "Wrong number of arguments. '#{name}' requires " +
                "#{required_input.length} arguments, you supplied " +
                "#{supplied_values.length}."
        end

        log "setting required input arguments ..."
        required_input.zip(supplied_values).each do |arg, value|
            arg.set_value match_image, value
        end

        # find optional unassigned input args
        log "finding optional unassigned input arguments ..."
        optional_input = all_args.select do |arg|
            not arg.isset and
            (arg.flags & :input) != 0 and
            (arg.flags & :required) == 0 
        end

        # make a hash from name to arg
        optional_input = Hash[
            optional_input.map(&:name).zip(optional_input)]

        # find optional unassigned output args
        log "finding optional unassigned output arguments ..."
        optional_output = all_args.select do |arg|
            not arg.isset and
            (arg.flags & :output) != 0 and
            (arg.flags & :required) == 0 
        end
        optional_output = Hash[
            optional_output.map(&:name).zip(optional_output)]

        # set all optional args
        log "setting optional values ..."
        optional_values.each do |name, value|
            # we are passed symbols as keys
            name = name.to_s
            if optional_input.has_key? name
                log "setting #{name} to #{value}"
                optional_input[name].set_value match_image, value
            elsif optional_output.has_key? name and value != true
                raise Vips::Error, 
                    "Optional output argument #{name} must be true."
            elsif not optional_output.has_key? name 
                raise Vips::Error, "No such option '#{name}',"
            end
        end

        # call
        log "before build ..."
        GC.start if $vips_debug
        Vips::Object::print_all if $vips_debug

        op2 = Vips::cache_operation_lookup op
        if op2
            log "cache hit"
            op = op2

            all_args = op.get_args

            # find optional output args
            optional_output = all_args.select do |arg|
                (arg.flags & :output) != 0 and
                (arg.flags & :required) == 0 
            end
            optional_output = Hash[
                optional_output.map(&:name).zip(optional_output)]
        else
            log "cache miss ... building"
            if not op.build
                raise Vips::Error
            end
            GC.start if $vips_debug
            Vips::Object::print_all if $vips_debug

            log "adding to cache ... "
            Vips::cache_operation_add op
        end

        log "after build ..."
        GC.start if $vips_debug
        Vips::Object::print_all if $vips_debug

        # gather output args 
        out = []

        all_args.each do |arg|
            # required output
            if (arg.flags & :output) != 0 and
                (arg.flags & :required) != 0 
                log "fetching required output #{arg.name}"
                out << arg.get_value
            end

            # modified input arg ... this will get the result of the 
            # copy() we did in Argument.set_value above
            if (arg.flags & :input) != 0 and
                (arg.flags & :modify) != 0 
                log "fetching modified input arg ..."
                out << arg.get_value
            end
        end

        opts = {}
        optional_values.each do |name, value|
            # we are passed symbols as keys
            name = name.to_s
            if optional_output.has_key? name
                log "fetching optional output arg ..."
                opts[name] = optional_output[name].get_value
            end
        end
        out << opts if opts != {}

        if out.length == 1
            out = out[0]
        elsif out.length == 0
            out = nil
        end

        # unref everything now we have refs to all outputs we want
        log "unreffing outputs ... "
        op.unref_outputs

        log "success! #{name}.out = #{out}"

        return out
    end

    public

    # :call-seq:
    #   call(operation_name, required_arg1, ..., required_argn, optional_args) => result
    #
    # This is the public entry point for the vips8 binding. Vips::call will run
    # any vips operation, for example
    #
    #   out = Vips::call "black", 100, 100, :bands => 12
    #
    # will call the C function 
    #
    #   vips_black( &out, 100, 100, "bands", 12, NULL );
    # 
    # There are Vips::Image#method_missing hooks which will run ::call for you 
    # on Vips::Image for undefined instance or class methods. So you can also 
    # write:
    #
    #   out = Vips::Image.black 100, 100, :bands => 12
    #
    # Or perhaps:
    #
    #   x = Vips::Image.black 100, 100
    #   y = x.invert
    #
    # to run the <tt>vips_invert()</tt> operator.
    #
    # There are also a set of operator overloads and some convenience functions,
    # see Vips::Image. 
    #
    # If the operator needs a vector constant, ::call will turn a scalar into a
    # vector for you. So for <tt>x.linear(a, b)</tt>, which calculates 
    # <tt>x * a + b</tt> where +a+ and +b+ are vector constants, you can write:
    #
    #   x = Vips::Image.black 100, 100, bands => 3
    #   y = x.linear(1, 2)
    #   y = x.linear([1], 4)
    #   y = x.linear([1, 2, 3], 4)
    #
    # or any other combination. The operator overloads use this facility to
    # support all the variations on:
    #
    #   x = Vips::Image.black 100, 100, bands => 3
    #   y = x * 2
    #   y = x + [1,2,3]
    #   y = x % [1]
    #
    # Similarly, whereever an image is required, you can use a constant. The
    # constant will be expanded to an image matching the first input image
    # argument. For example, you can write:
    #
    #   x = Vips::Image.black 100, 100, bands => 3
    #   y = x.bandjoin(255)
    #
    # to add an extra band to the image where each pixel in the new band has 
    # the constant value 255. 

    def self.call(name, *args)
        Vips::call_base name, nil, "", args
    end

end
