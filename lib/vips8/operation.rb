module Vips

    class Operation
        # Fetch arg list, remove boring ones, sort into priority order.
        def get_args
            object_class = GObject::object_class_from_instance self
            io_bits = Vips::ArgumentFlags[:input] | Vips::ArgumentFlags[:output]
            props = object_class.list_properties.select do |prop|
                flags = get_argument_flags prop.name
                flags = Vips::ArgumentFlags.to_native flags, 1
                (flags & io_bits != 0) &&
                    (flags & Vips::ArgumentFlags[:deprecated] == 0)
            end
            args = props.map {|x| Argument.new self, x}
            args.sort! {|a, b| a.priority - b.priority}
        end
    end
end
