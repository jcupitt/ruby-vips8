# This class is used internally to convert Ruby values to arguments to libvips
# operations. 

module Vips

    class Argument # :nodoc:
        attr_reader :op, :prop, :name, :flags, :priority, :isset

        def initialize(op, name)
            gobject_class = op.gtype.to_class
            @op = op
            @name = name.tr '-', '_'
            @prop = gobject_class.property name
            @flags = op.get_argument_flags name
            @priority = op.get_argument_priority @name
            @isset = op.argument_isset @name
        end

        private

        def self.imageize match_image, value
            return value if match_image == nil
            return value if value.is_a? Vips::Image

            pixel = (Vips::Image.black(1, 1) + value).cast(match_image.format)
            pixel.embed(0, 0, match_image.width, match_image.height, 
                        :extend => :copy)
        end

        class ArrayImageConst < Vips::ArrayImage # :nodoc: 
            def self.new(value)
                if not value.is_a? Array
                    value = [value]
                end

                match_image = value.find {|x| x.is_a? Vips::Image}
                if match_image == nil
                    raise Vips::Error, 
                        "Argument must contain at least one image."
                end

                value = value.map {|x| Argument::imageize match_image, x}

                super(value)
            end
        end

        # if this gtype needs an array, try to transform the value into one
        def self.arrayize(gtype, value)
            arrayize_map = {
                GLib::Type["VipsArrayDouble"] => Vips::ArrayDouble,
                GLib::Type["VipsArrayInt"] => Vips::ArrayInt,
                GLib::Type["VipsArrayImage"] => ArrayImageConst
            }

            if arrayize_map.has_key? gtype
                if not value.is_a? Array
                    value = [value]
                end

                value = arrayize_map[gtype].new value
            end

            value
        end

        def self.unwrap value
            [Vips::Blob, Vips::ArrayDouble, Vips::ArrayImage, 
                Vips::ArrayInt].each do |cls|
                if value.is_a? cls
                    value = value.get
                    break 
                end
            end

            # we could try to unpack GirFFI::SizedArray with to_a, but that's 
            # not the right thing to do for blobs like profiles

            value
        end

        public

        def set_value(match_image, value)
            # array-ize
            value = Argument::arrayize prop.value_type, value

            # blob-ize
            if prop.value_type.type_is_a? GLib::Type["VipsBlob"]
                if not value.is_a? Vips::Blob
                    value = Vips::Blob.new(nil, value)
                end
            end

            # image-ize
            if prop.value_type.type_is_a? GLib::Type["VipsImage"]
                if not value.is_a? Vips::Image
                    value = imageize match_image, value
                end
            end

            # MODIFY input images need to be copied before assigning them
            if (flags & :modify) != 0
                # don't use .copy(): we want to make a new pipeline with no
                # reference back to the old stuff ... this way we can free the
                # previous image earlier 
                new_image = Vips::Image.memory
                value.write new_image
                value = new_image
            end

            op.set_property @name, value
        end

        def get_value
            Argument::unwrap @op.get_property(@name)
        end

        def description
            name = @name
            blurb = @prop.get_blurb
            direction = (@flags & :input) != 0 ?  "input" : "output"
            type = @prop.value_type.name

            result = "[#{name}] #{blurb}, #{direction} #{type}"
        end

    end

end
