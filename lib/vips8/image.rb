module Vips

    class Image
        private

        # handy for overloads ... want to be able to apply a function to an 
        # array or to a scalar
        def self.smap(x, &block)
            x.is_a?(Array) ? x.map {|x| smap(x, &block)} : block.(x)
        end

        public

        # Invoke a vips operation with Vips::call, using #self as the first 
        # input image argument. 
        def method_missing(name, *args)
            Vips::call_base(name.to_s, self, "", args)
        end

        # Invoke a vips operation with ::call.
        def self.method_missing(name, *args)
            Vips::call_base name.to_s, nil, "", args
        end

        # Return a new Vips::Image for a file on disc. This method can load
        # images in any format supported by vips. The filename can include
        # load options, for example:
        #
        #   image = Vips::new_from_file "fred.jpg[shrink=2]"
        #
        # You can also supply options as a hash, for example:
        #
        #   image = Vips::new_from_file "fred.jpg", :shrink => 2
        #
        # The options available depend upon the load operation that will be
        # executed. Try something like:
        #
        #   $ vips jpegload
        #
        # at the command-line to see a summary of the available options.
        #
        # Loading is fast: only enough of the image is loaded to be able to fill
        # out the header. Pixels will only be processed when they are needed.
        def self.new_from_file(name, *args)
            # very common, and Vips::filename_get_filename will segv if we pass
            # this
            if name == nil
                raise Error, "filename is nil"
            end
            filename = Vips::filename_get_filename name
            option_string = Vips::filename_get_options name
            loader = Vips::Foreign.find_load filename
            if loader == nil
                raise Vips::Error
            end

            Vips::call_base loader, nil, option_string, [filename] + args
        end

        # Create a new Vips::Image for an image encoded in a format, such as
        # JPEG, in a memory string. Load options may be passed encoded as
        # strings, or appended as a hash. For example:
        #
        #   image = Vips::new_from_from_buffer memory_buffer, "shrink=2"
        # 
        # or alternatively:
        #
        #   image = Vips::new_from_from_buffer memory_buffer, "", :shrink => 2
        #
        # The options available depend on the file format. Try something like:
        #
        #   $ vips jpegload_buffer
        #
        # at the command-line to see the availeble options. Only JPEG, PNG and
        # TIFF images can be read from memory buffers. 
        #
        # Loading is fast: only enough of the image is loaded to be able to fill
        # out the header. Pixels will only be processed when they are needed.
        def self.new_from_buffer(data, option_string, *args)
            loader = Vips::Foreign.find_load_buffer data
            if loader == nil
                raise Vips::Error
            end

            Vips::call_base loader, nil, option_string, [data] + args
        end

        # Create a new Vips::Image from a 1D or 2D array. A 1D array becomes an
        # image with height 1. Use +scale+ and +offset+ to set the scale and
        # offset fields in the header. These are useful for integer
        # convolutions. 
        #
        # For example:
        #
        #   image = Vips::new_from_from_array [1, 2, 3]
        #
        # or
        #
        #   image = Vips::new_from_from_array [
        #       [-1, -1, -1],
        #       [-1, 16, -1],
        #       [-1, -1, -1]], 8
        #
        # for a simple sharpening mask.
        def self.new_from_array(array, scale = 1, offset = 0)
            # we accept a 1D array and assume height == 1, or a 2D array
            # and check all lines are the same length
            if not array.is_a? Array
                raise Vips::Error, "Argument is not an array."
            end

            if array[0].is_a? Array
                height = array.length
                width = array[0].length
                if not array.all? {|x| x.is_a? Array}
                    raise Vips::Error, "Not a 2D array."
                end
                if not array.all? {|x| x.length == width}
                    raise Vips::Error, "Array not rectangular."
                end
                array = array.flatten
            else
                height = 1
                width = array.length
            end

            if not array.all? {|x| x.is_a? Numeric}
                raise Vips::Error, "Not all array elements are Numeric."
            end

            image = Vips::Image.new_matrix_from_array width, height, array

            # be careful to set them as double
            image.set_double 'scale', scale.to_f
            image.set_double 'offset', offset.to_f

            return image
        end

        # Write this image to a file. Save options may be encoded in the
        # filename or given as a hash. For example:
        #
        #   image.write_to_file "fred.jpg[Q=90]"
        #
        # or equivalently:
        #
        #   image.write_to_file "fred.jpg", :Q => 90
        #
        # The save options depend on the selected saver. Try something like:
        #
        #   $ vips jpegsave
        #
        # to see all the available options. 
        def write_to_file(name, *args)
            filename = Vips::filename_get_filename name
            option_string = Vips::filename_get_options name
            saver = Vips::Foreign.find_save filename
            if saver == nil
                raise Vips::Error, "No known saver for '#{filename}'."
            end

            Vips::call_base saver, self, option_string, [filename] + args
        end

        # Write this image to a memory buffer. Save options may be encoded in 
        # the format_string or given as a hash. For example:
        #
        #   buffer = image.write_to_buffer ".jpg[Q=90]"
        #
        # or equivalently:
        #
        #   image.write_to_buffer ".jpg", :Q => 90
        #
        # The save options depend on the selected saver. Try something like:
        #
        #   $ vips jpegsave
        #
        # to see all the available options. 
        def write_to_buffer(format_string, *args)
            filename = Vips::filename_get_filename format_string
            option_string = Vips::filename_get_options format_string
            saver = Vips::Foreign.find_save_buffer filename
            if saver == nil
                raise Vips::Error, "No known saver for '#{filename}'."
            end

            Vips::call_base saver, self, option_string, args
        end

        ##
        # :method: width
        # :call-seq:
        #    width => integer
        #
        # Image width, in pixels. 

        ##
        # :method: height
        # :call-seq:
        #    height => integer
        #
        # Image height, in pixels. 

        ##
        # :method: bands
        # :call-seq:
        #    bands => integer
        #
        # Number of image bands (channels). 

        ##
        # :method: format
        # :call-seq:
        #    format => Vips::BandFormat
        #
        # Image pixel format. For example, an 8-bit unsigned image has the
        # :uchar format. 

        ##
        # :method: interpretation
        # :call-seq:
        #    interpretation => Vips::Interpretation
        #
        # Image interpretation. 

        ##
        # :method: coding
        # :call-seq:
        #    coding => Vips::Coding
        #
        # Image coding. 

        ##
        # :method: filename
        # :call-seq:
        #    filename => string
        #
        # The name of the file this image was originally loaded from.

        ##
        # :method: xres
        # :call-seq:
        #    xres => float
        #
        # The horizontal resolution of the image, in pixels per millimetre. 

        ##
        # :method: yres
        # :call-seq:
        #    yres => float
        #
        # The vertical resolution of the image, in pixels per millimetre. 

        # Set a metadata item on an image. Ruby types are automatically
        # transformed into the matching GValue, if possible. 
        #
        # For example, you can use this to set an image's ICC profile:
        #
        #   x = y.set_value "icc-profile-data", profile
        #
        # where +profile+ is an ICC profile held as a binary string object.
        #
        # If you need more control over the conversion process, use #set to 
        # set a GValue directly.
        def set_value(name, value)
            gtype = get_typeof name
            if gtype != 0
                # array-ize
                value = Argument::arrayize prop.value_type, value

                # blob-ize
                if GObject::type_is_a(gtype, Vips::TYPE_BLOB)
                    if not value.is_a? Vips::Blob
                        value = Vips::Blob.new(nil, value)
                    end
                end

                # image-ize
                if GObject::type_is_a(gtype, Vips::TYPE_IMAGE)
                    if not value.is_a? Vips::Image
                        value = Argument::imageize self, value
                    end
                end
            end

            set name, value
        end

        # Get a metadata item from an image. Ruby types are constructed 
        # automatically from the GValue, if possible. 
        #
        # For example, you can read the ICC profile from an image like this:
        #
        #    profile = image.get_value "icc-profile-data"
        #
        # and profile will be a binary string containing the profile. 
        #
        # Use #get to fetch a GValue directly.
        def get_value(name)
            # get the GValue
            value = get name

            # pull out the value
            value = value.get_value

            Argument::unwrap(value)
        end

        # Add an image, constant or array. 
        def +(other)
            other.is_a?(Vips::Image) ? add(other) : linear(1, other)
        end

        # Subtract an image, constant or array. 
        def -(other)
            other.is_a?(Vips::Image) ? 
                subtract(other) : linear(1, smap(other) {|x| x * -1})
        end

        # Multiply an image, constant or array. 
        def *(other)
            other.is_a?(Vips::Image) ? multiply(other) : linear(other, 0)
        end

        # Divide an image, constant or array. 
        def /(other)
            other.is_a?(Vips::Image) ? 
                divide(other) : linear(smap(other) {|x| 1.0 / x}, 0)
        end

        # Remainder after integer division with an image, constant or array. 
        def %(other)
            other.is_a?(Vips::Image) ? 
                remainder(other) : remainder_const(other)
        end

        # Raise to power of an image, constant or array. 
        def **(other)
            other.is_a?(Vips::Image) ? 
                math2(other, :pow) : math2_const(other, :pow)
        end

        # Integer left shift with an image, constant or array. 
        def <<(other)
            other.is_a?(Vips::Image) ? 
                boolean(other, :lshift) : boolean_const(other, :lshift)
        end

        # Integer right shift with an image, constant or array. 
        def >>(other)
            other.is_a?(Vips::Image) ? 
                boolean(other, :rshift) : boolean_const(other, :rshift)
        end

        # Integer bitwise OR with an image, constant or array. 
        def |(other)
            other.is_a?(Vips::Image) ? 
                boolean(other, :or) : boolean_const(other, :or)
        end

        # Integer bitwise AND with an image, constant or array. 
        def &(other)
            other.is_a?(Vips::Image) ? 
                boolean(other, :and) : boolean_const(other, :and)
        end

        # Integer bitwise EOR with an image, constant or array. 
        def ^(other)
            other.is_a?(Vips::Image) ? 
                boolean(other, :eor) : boolean_const(other, :eor)
        end

        # Equivalent to image ^ -1
        def !
            self ^ -1
        end

        # Equivalent to image ^ -1
        def ~
            self ^ -1
        end

        def +@
            self
        end

        # Equivalent to image * -1
        def -@
            self * -1
        end

        # Relational less than with an image, constant or array. 
        def <(other)
            other.is_a?(Vips::Image) ? 
                relational(other, :less) : relational_const(other, :less)
        end

        # Relational less than or equal to with an image, constant or array. 
        def <=(other)
            other.is_a?(Vips::Image) ? 
                relational(other, :lesseq) : relational_const(other, :lesseq)
        end

        # Relational more than with an image, constant or array. 
        def >(other)
            other.is_a?(Vips::Image) ? 
                relational(other, :more) : relational_const(other, :more)
        end

        # Relational more than or equal to with an image, constant or array. 
        def >(other)
            other.is_a?(Vips::Image) ? 
                relational(other, :moreeq) : relational_const(other, :moreeq)
        end

        # Compare equality to nil, an image, constant or array.
        def ==(other)
            if other == nil
                false
            elsif other.is_a?(Vips::Image)  
                relational(other, :equal) 
            else
                relational_const(other, :equal)
            end
        end

        # Compare inequality to nil, an image, constant or array.
        def !=(other)
            if other == nil
                true
            elsif other.is_a?(Vips::Image) 
                relational(other, :noteq) 
            else
                relational_const(other, :noteq)
            end
        end

        # Return the largest integral value not greater than the argument.
        def floor
            round :floor
        end

        # Return the smallest integral value not less than the argument.
        def ceil
            round :ceil
        end

        # Return the nearest integral value.
        def rint
            round :rint
        end

        # :call-seq:
        #   bandsplit => [image]
        #
        # Split an n-band image into n separate images.
        def bandsplit
            (0...bands).map {|i| extract_band(i)}
        end

        # :call-seq:
        #   bandjoin(image) => out
        #   bandjoin(const_array) => out
        #   bandjoin(image_array) => out
        #
        # Join a set of images bandwise.
        def bandjoin(other)
            if not other.is_a? Array
                other = [other]
            end

            Vips::Image.bandjoin([self] + other)
        end

        # Return the coordinates of the image maximum.
        def maxpos
            v, opts = max :x => True, :y => True
            x = opts['x']
            y = opts['y']
            return v, x, y
        end

        # Return the coordinates of the image minimum.
        def minpos
            v, opts = min :x => True, :y => True
            x = opts['x']
            y = opts['y']
            return v, x, y
        end

        # Return the real part of a complex image.
        def real
            complexget :real
        end

        # Return the imaginary part of a complex image.
        def imag
            complexget :imag
        end

        # Return an image converted to polar coordinates.
        def polar
            complex :polar
        end

        # Return an image converted to rectangular coordinates.
        def rect
            complex :rect 
        end

        # Return the complex conjugate of an image.
        def conj
            complex :conj 
        end

        # Return the sine of an image in degrees.
        def sin
            math :sin 
        end

        # Return the cosine of an image in degrees.
        def cos
            math :cos
        end

        # Return the tangent of an image in degrees.
        def tan
            math :tan
        end

        # Return the inverse sine of an image in degrees.
        def asin
            math :asin
        end

        # Return the inverse cosine of an image in degrees.
        def acos
            math :acos
        end

        # Return the inverse tangent of an image in degrees.
        def atan
            math :atan
        end

        # Return the natural log of an image.
        def log
            math :log
        end

        # Return the log base 10 of an image.
        def log10
            math :log10
        end

        # Return e ** pixel.
        def exp
            math :exp
        end

        # Return 10 ** pixel.
        def exp10
            math :exp10
        end

        # Select pixels from +th+ if +self+ is non-zero and from +el+ if
        # +self+ is zero. Use the :blend option to fade smoothly 
        # between +th+ and +el+. 
        def ifthenelse(th, el, *args) 
            match_image = [th, el, self].find {|x| x.is_a? Vips::Image}

            if not th.is_a? Vips::Image
                th = Argument::imageize match_image, th
            end
            if not el.is_a? Vips::Image
                el = Argument::imageize match_image, el
            end

            Vips::call_base "ifthenelse", self, "", [th, el] + args
        end

    end

    # This method generates rdoc comments for all the dynamically bound
    # vips operations. 

    #--
    # See the comment in the next section.
    #++

    def self.generate_rdoc
        no_generate = ["bandjoin", "ifthenelse"]

        generate_operation = lambda do |op|
            flags = op.get_flags
            return if (flags & :deprecated) != 0
            nickname = Vips::nickname_find op.gtype

            return if no_generate.include? nickname

            all_args = op.get_args.select {|arg| not arg.isset}

            # separate args into various categories
 
            required_input = all_args.select do |arg|
                (arg.flags & :input) != 0 and
                (arg.flags & :required) != 0 
            end

            optional_input = all_args.select do |arg|
                (arg.flags & :input) != 0 and
                (arg.flags & :required) == 0 
            end

            required_output = all_args.select do |arg|
                (arg.flags & :output) != 0 and
                (arg.flags & :required) != 0 
            end

            # required input args with :modify are copied and appended to 
            # output
            modified_required_input = required_input.select do |arg|
                (arg.flags & :modify) != 0 
            end
            required_output += modified_required_input

            optional_output = all_args.select do |arg|
                (arg.flags & :output) != 0 and
                (arg.flags & :required) == 0 
            end

            # optional input args with :modify are copied and appended to 
            # output
            modified_optional_input = optional_input.select do |arg|
                (arg.flags & :modify) != 0 
            end
            optional_output += modified_optional_input

            # find the first input image, if any ... we will be a method of this
            # instance
            member_x = required_input.find do |x|
                x.prop.value_type.type_is_a? GLib::Type["VipsImage"]
            end
            if member_x != nil
                required_input.delete member_x
            end

            description = op.get_description

            puts "##"
            if member_x 
                puts "# :method: #{nickname}"
            else
                puts "# :singleton-method: #{nickname}"
            end
            puts "# :call-seq:"
            input = required_input.map(&:name).join(", ")
            output = required_output.map(&:name).join(", ")
            puts "#    #{nickname}(#{input}) => #{output}"
            puts "#"
            puts "# #{description.capitalize}."
            if required_input.length > 0 
                puts "#"
                puts "# Input:"
                required_input.each {|arg| puts "# #{arg.description}"}
            end
            if required_output.length > 0 
                puts "#"
                puts "# Output:"
                required_output.each {|arg| puts "# #{arg.description}"}
            end
            if optional_input.length > 0 
                puts "#"
                puts "# Options:"
                optional_input.each {|arg| puts "# #{arg.description}"}
            end
            if optional_output.length > 0 
                puts "#"
                puts "# Output options:"
                optional_output.each {|arg| puts "# #{arg.description}"}
            end
            puts ""
        end

        generate_class = lambda do |gtype|
            # can be nil for abstract types
            # can't find a way to get to #abstract? from a gtype
            op = Vips::Operation.new gtype.name
            Vips::error_clear

            generate_operation.(op) if op != nil

            gtype.children.each do |x|
                generate_class.(x)
            end
        end

        puts "#--"
        puts "# This file generated automatically. Do not edit!"
        puts "#++"
        puts ""

        generate_class.(GLib::Type["VipsOperation"])
    end

end

