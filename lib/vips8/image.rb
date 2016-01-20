# This module provides a set of overrides for the {vips image processing 
# library}[http://www.vips.ecs.soton.ac.uk]
# used via the {gobject-introspection
# gem}[https://rubygems.org/gems/gobject-introspection]. 
#
# It needs vips-8.2 or later to be installed, 
# and <tt>Vips-8.0.typelib</tt>, the vips typelib, needs to be on your 
# +GI_TYPELIB_PATH+.
#
# == Example
#
#    require 'vips8'
#
#    if ARGV.length < 2
#        raise "usage: #{$PROGRAM_NAME}: input-file output-file"
#    end
#
#    im = Vips::Image.new_from_file ARGV[0], :access => :sequential
#
#    im *= [1, 2, 1]
#
#    mask = Vips::Image.new_from_array [
#            [-1, -1, -1],
#            [-1, 16, -1],
#            [-1, -1, -1]], 8
#    im = im.conv mask
#
#    im.write_to_file ARGV[1]
#
# This example loads a file, boosts the green channel (I'm not sure why), 
# sharpens the image, and saves it back to disc again. 
#
# Vips::Image.new_from_file can load any image file supported by vips. In this
# example, we will be accessing pixels top-to-bottom as we sweep through the
# image reading and writing, so :sequential access mode is best for us. The
# default mode is :random, this allows for full random access to image pixels,
# but is slower and needs more memory. See the libvips API docs for VipsAccess
# for full details
# on the various modes available. You can also load formatted images from 
# memory buffers or create images that wrap C-style memory arrays. 
#
# Multiplying the image by an array constant uses one array element for each
# image band. This line assumes that the input image has three bands and will
# double the middle band. For RGB images, that's doubling green.
#
# Vips::Image.new_from_array creates an image from an array constant. The 8 at
# the end sets the scale: the amount to divide the image by after 
# integer convolution. See the libvips API docs for vips_conv() (the operation
# invoked by Vips::Image.conv) for details. 
#
# Vips::Image.write_to_file writes an image back to the filesystem. It can write
# any format supported by vips: the file type is set from the filename suffix.
# You can also write formatted images to memory buffers, or dump image data to a
# raw memory array. 
#
# == How it works
#
# The C sources to libvips include a set of specially formatted
# comments which describe its interfaces. When you compile the library,
# gobject-introspection generates <tt>Vips-8.0.typelib</tt>, a file 
# describing how to use libvips.
#
# The gobject-introspection gem loads this typelib and uses it to let you call 
# functions in libvips directly from Ruby. However, the interface you get 
# from raw gobject-introspection is rather ugly, so ruby-vips8 adds a set 
# of overrides which try to make it nicer to use. 
#
# The API you end up with is a Ruby-ish version of the C API. Full documentation
# on the operations and what they do is there, you can use it directly. This
# document explains the features of the Ruby API and lists the available libvips
# operations very briefly. 
#
# == Automatic wrapping
#
# ruby-vips8 adds a Vips::Image.method_missing handler to Vips::Image and uses
# it to look up vips operations. For example, the libvips operation +add+, which
# appears in C as vips_add(), appears in Ruby as Vips::image.add. 
#
# The operation's list of required arguments is searched and the first input 
# image is set to the value of +self+. Operations which do not take an input 
# image, such as Vips::Image.black, appear as class methods. The remainder of
# the arguments you supply in the function call are used to set the other
# required input arguments. If the final supplied argument is a hash, it is used
# to set any optional input arguments. The result is the required output 
# argument if there is only one result, or an array of values if the operation
# produces several results. 
#
# For example, Vips::image.min, the vips operation that searches an image for 
# the minimum value, has a large number of optional arguments. You can use it to
# find the minimum value like this:
#
#   min_value = image.min
#
# You can ask it to return the position of the minimum with :x and :y.
#   
#   min_value, x_pos, y_pos = image.min :x => true, :y => true
#
# Now x_pos and y_pos will have the coordinates of the minimum value. There's
# actually a convenience function for this, Vips::Image.minpos.
#
# You can also ask for the top n minimum, for example:
#
#   min_value, x_pos, y_pos = image.min :size => 10,
#       :x_array => true, :y_array => true
#
# Now x_pos and y_pos will be 10-element arrays. 
#
# Because operations are member functions and return the result image, you can
# chain them. For example, you can write:
#
#   result_image = image.imag.cos
#
# to calculate the cosine of the imaginary part of a complex image. 
# There are also a full set
# of arithmetic operator overloads, see below.
#
# libvips types are also automatically wrapped. The override looks at the type 
# of argument required by the operation and converts the value you supply, 
# when it can. For example, "linear" takes a Vips::ArrayDouble as an argument 
# for the set of constants to use for multiplication. You can supply this 
# value as an integer, a float, or some kind of compound object and it 
# will be converted for you. You can write:
#
#   result_image = image.linear 1, 3 
#   result_image = image.linear 12.4, 13.9 
#   result_image = image.linear [1, 2, 3], [4, 5, 6] 
#   result_image = image.linear 1, [4, 5, 6] 
#
# And so on. A set of overloads are defined for Vips::Image.linear, see below.
#
# It does a couple of more ambitious conversions. It will automatically convert
# to and from the various vips types, like Vips::Blob and Vips::ArrayImage. For
# example, you can read the ICC profile out of an image like this: 
#
#   profile = im.get_value "icc-profile-data"
#
# and profile will be a byte array.
#
# If an operation takes several input images, you can use a constant for all but
# one of them and the wrapper will expand the constant to an image for you. For
# example, Vips::Image.ifthenelse uses a condition image to pick pixels 
# between a then and an else image:
#
#   result_image = condition_image.ifthenelse then_image, else_image
#
# You can use a constant instead of either the then or the else parts and it
# will be expanded to an image for you. If you use a constant for both then and
# else, it will be expanded to match the condition image. For example:
#
#    result_image = condition_image.ifthenelse [0, 255, 0], [255, 0, 0]
#
# Will make an image where true pixels are green and false pixels are red.
#
# This is useful for Vips::Image.bandjoin, the thing to join two or more 
# images up bandwise. You can write:
#
#   rgba = rgb.bandjoin 255
#
# to append a constant 255 band to an image, perhaps to add an alpha channel. Of
# course you can also write:
#
#   result_image = image1.bandjoin image2
#   result_image = image1.bandjoin [image2, image3]
#   result_image = Vips::Image.bandjoin [image1, image2, image3]
#   result_image = image1.bandjoin [image2, 255]
#
# and so on. 
# 
# == Automatic rdoc documentation
#
# These API docs are generated automatically by Vips::generate_rdoc. It examines
# libvips and writes a summary of each operation and the arguments and options
# that operation expects. 
# 
# Use the C API docs for more detail.
#
# == Exceptions
#
# The wrapper spots errors from vips operations and raises the Vips::Error
# exception. You can catch it in the usual way. 
# 
# == Draw operations
#
# Paint operations like Vips::Image.draw_circle and Vips::Image.draw_line 
# modify their input image. This
# makes them hard to use with the rest of libvips: you need to be very careful
# about the order in which operations execute or you can get nasty crashes.
#
# The wrapper spots operations of this type and makes a private copy of the
# image in memory before calling the operation. This stops crashes, but it does
# make it inefficient. If you draw 100 lines on an image, for example, you'll
# copy the image 100 times. The wrapper does make sure that memory is recycled
# where possible, so you won't have 100 copies in memory. 
#
# If you want to avoid the copies, you'll need to call drawing operations
# yourself.
#
# == Overloads
#
# The wrapper defines the usual set of arithmetic, boolean and relational
# overloads on image. You can mix images, constants and lists of constants
# (almost) freely. For example, you can write:
#
#   result_image = ((image * [1, 2, 3]).abs < 128) | 4
#
# == Expansions
#
# Some vips operators take an enum to select an action, for example 
# Vips::Image.math can be used to calculate sine of every pixel like this:
#
#   result_image = image.math :sin
#
# This is annoying, so the wrapper expands all these enums into separate members
# named after the enum. So you can write:
#
#   result_image = image.sin
#
# == Convenience functions
#
# The wrapper defines a few extra useful utility functions: 
# Vips::Image.get_value, Vips::Image.set_value, Vips::Image.bandsplit, 
# Vips::Image.maxpos, Vips::Image.minpos. 

module Vips

    class Image
        private

        # handy for overloads ... want to be able to apply a function to an 
        # array or to a scalar
        def self.smap(x, &block)
            x.is_a?(Array) ? x.map {|x| smap(x, &block)} : block.(x)
        end

        # run a complex operation on a complex image, or an image with an even
        # number of bands ... handy for things like running .polar on .index
        # images
        def self.run_cmplx(image, &block)
            original_format = image.format

            if not Vips::band_format_iscomplex image.format
                if image.bands % 2 != 0
                    raise Error, "not an even number of bands"
                end

                if not Vips::band_format_isfloat image.format
                    image = image.cast :float 
                end

                new_format = image.format == :double ? :dpcomplex : :complex
                image = image.copy :format => new_format, 
                    :bands => image.bands / 2
            end

            image = block.(image)

            if not Vips::band_format_iscomplex original_format
                new_format = image.format == :dpcomplex ? :double : :float
                image = image.copy :format => new_format, 
                    :bands => image.bands * 2
            end

            image
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
        #   image = Vips::new_from_array [1, 2, 3]
        #
        # or
        #
        #   image = Vips::new_from_array [
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

            image = Vips::Image.matrix_from_array width, height, array
            if image == nil
                raise Vips::Error
            end

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
                value = Argument::arrayize gtype, value

                # blob-ize
                if gtype.type_is_a? GLib::Type["VipsBlob"]
                    if not value.is_a? Vips::Blob
                        value = Vips::Blob.copy value
                    end
                end

                # image-ize
                if gtype.type_is_a? GLib::Type["VipsImage"]
                    if not value.is_a? Vips::Image
                        value = imageize match_image, value
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
        # and profile will be an array containing the profile. 
        #
        # Use #get to fetch a GValue directly.
        def get_value(name)
            ret, gval = get name
            if ret[0] != 0
                raise Vips::Error, "Field #{name} not found."
            end
            value = gval.value

            Argument::unwrap(value)
        end

        # Add an image, constant or array. 
        def +(other)
            other.is_a?(Vips::Image) ? add(other) : linear(1, other)
        end

        # Subtract an image, constant or array. 
        def -(other)
            other.is_a?(Vips::Image) ? 
                subtract(other) : linear(1, Image::smap(other) {|x| x * -1})
        end

        # Multiply an image, constant or array. 
        def *(other)
            other.is_a?(Vips::Image) ? multiply(other) : linear(other, 0)
        end

        # Divide an image, constant or array. 
        def /(other)
            other.is_a?(Vips::Image) ? 
                divide(other) : linear(Image::smap(other) {|x| 1.0 / x}, 0)
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
        def >=(other)
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

        # Fetch bands using a number or a range
        def [](index)
            if index.is_a? Range
                n = index.end - index.begin
                n += 1 if not index.exclude_end?
                extract_band index.begin, :n => n
            elsif index.is_a? Numeric
                extract_band index 
            else
                raise Vips::Error, "[] index is not range or numeric."
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

        # AND the bands of an image together
        def bandand
            bandbool :and
        end

        # OR the bands of an image together
        def bandor
            bandbool :or
        end

        # EOR the bands of an image together
        def bandeor
            bandbool :eor
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
            v, opts = max :x => true, :y => true
            x = opts['x']
            y = opts['y']
            return v, x, y
        end

        # Return the coordinates of the image minimum.
        def minpos
            v, opts = min :x => true, :y => true
            x = opts['x']
            y = opts['y']
            return v, x, y
        end

        # get the value of a pixel as an array
        def getpoint(x, y)
            # vips has an operation that does this, but we can't call it via
            # gobject-introspection 3.0.7 since it's missing array double
            # returns
            #
            # remove this def when gobject-introspection updates
            crop(x, y, 1, 1).bandsplit.map {|i| i.avg}
        end

        # a median filter
        def median(size = 3)
            rank(size, size, (size * size) / 2)
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
            Image::run_cmplx(self) {|x| x.complex :polar}
        end

        # Return an image converted to rectangular coordinates.
        def rect
            Image::run_cmplx(self) {|x| x.complex :rect}
        end

        # Return the complex conjugate of an image.
        def conj
            Image::run_cmplx(self) {|x| x.complex :conj}
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

        # Flip horizontally.
        def fliphor
            flip :horizontal
        end

        # Flip vertically.
        def flipver
            flip :vertical
        end

        # Erode with a structuring element.
        def erode(mask)
            morph mask, :erode
        end

        # Dilate with a structuring element.
        def dilate(mask)
            morph mask, :dilate
        end

        # Rotate by 90 degrees clockwise.
        def rot90
            rot :d90
        end

        # Rotate by 180 degrees clockwise.
        def rot180
            rot :d180
        end

        # Rotate by 270 degrees clockwise.
        def rot270
            rot :d270
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
    #
    # Regenerate with something like: 
    #
    #   ruby > methods.rb
    #   require 'vips8'
    #   Vips::generate_rdoc
    #   ^D

    def self.generate_rdoc
        no_generate = ["bandjoin", "ifthenelse"]

        generate_operation = lambda do |op|
            flags = op.flags
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

            description = op.description

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
            begin
                # can fail for abstract types
                # can't find a way to get to #abstract? from a gtype
                op = Vips::Operation.new gtype.name
            rescue
                op = nil
            end

            generate_operation.(op) if op

            gtype.children.each do |x|
                generate_class.(x)
            end
        end

        puts "#--"
        puts "# This file generated automatically. Do not edit!"
        puts "#++"
        puts ""
        puts ""
        puts "module Vips"
        puts "  class Image"

        generate_class.(GLib::Type["VipsOperation"])

        puts "  end"
        puts "end"
    end

end

