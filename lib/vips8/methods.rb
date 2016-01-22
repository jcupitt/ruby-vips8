module Vips
  class Image

# @!method self.system(cmd_format, opts = {})
#   Run an external command.
#   @param cmd_format [String] Command to run
#   @param [Hash] opts Set of options
#   @option opts [Array<Image>] :in Array of input images
#   @option opts [String] :in_format Format for input filename
#   @option opts [String] :out_format Format for output filename
#   @option opts [Vips::Image] :out Output image
#   @option opts [String] :log Command log
#   @return [] 

# @!method add(right, opts = {})
#   Add two images.
#   @param right [Vips::Image] Right-hand image argument
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method subtract(right, opts = {})
#   Subtract two images.
#   @param right [Vips::Image] Right-hand image argument
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method multiply(right, opts = {})
#   Multiply two images.
#   @param right [Vips::Image] Right-hand image argument
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method divide(right, opts = {})
#   Divide two images.
#   @param right [Vips::Image] Right-hand image argument
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method relational(right, relational, opts = {})
#   Relational operation on two images.
#   @param right [Vips::Image] Right-hand image argument
#   @param relational [Vips::OperationRelational] relational to perform
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method remainder(right, opts = {})
#   Remainder after integer division of two images.
#   @param right [Vips::Image] Right-hand image argument
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method boolean(right, boolean, opts = {})
#   Boolean operation on two images.
#   @param right [Vips::Image] Right-hand image argument
#   @param boolean [Vips::OperationBoolean] boolean to perform
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method math2(right, math2, opts = {})
#   Binary math operations.
#   @param right [Vips::Image] Right-hand image argument
#   @param math2 [Vips::OperationMath2] math to perform
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method complex2(right, cmplx, opts = {})
#   Complex binary operations on two images.
#   @param right [Vips::Image] Right-hand image argument
#   @param cmplx [Vips::OperationComplex2] binary complex operation to perform
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method complexform(right, opts = {})
#   Form a complex image from two real images.
#   @param right [Vips::Image] Right-hand image argument
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method self.sum(in, opts = {})
#   Sum an array of images.
#   @param in [Array<Image>] Array of input images
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method invert(, opts = {})
#   Invert an image.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method linear(a, b, opts = {})
#   Calculate (a * in + b).
#   @param a [Array<Double>] Multiply by this
#   @param b [Array<Double>] Add this
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :uchar Output should be uchar
#   @return [Vips::Image] Output image

# @!method math(math, opts = {})
#   Apply a math operation to an image.
#   @param math [Vips::OperationMath] math to perform
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method abs(, opts = {})
#   Absolute value of an image.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method sign(, opts = {})
#   Unit vector of pixel.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method round(round, opts = {})
#   Perform a round function on an image.
#   @param round [Vips::OperationRound] rounding operation to perform
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method relational_const(c, relational, opts = {})
#   Relational operations against a constant.
#   @param c [Array<Double>] Array of constants
#   @param relational [Vips::OperationRelational] relational to perform
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method remainder_const(c, opts = {})
#   Remainder after integer division of an image and a constant.
#   @param c [Array<Double>] Array of constants
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method boolean_const(c, boolean, opts = {})
#   Boolean operations against a constant.
#   @param c [Array<Double>] Array of constants
#   @param boolean [Vips::OperationBoolean] boolean to perform
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method math2_const(c, math2, opts = {})
#   Pow( @in, @c ).
#   @param c [Array<Double>] Array of constants
#   @param math2 [Vips::OperationMath2] math to perform
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method complex(cmplx, opts = {})
#   Perform a complex operation on an image.
#   @param cmplx [Vips::OperationComplex] complex to perform
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method complexget(get, opts = {})
#   Get a component from a complex image.
#   @param get [Vips::OperationComplexget] complex to perform
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method avg(, opts = {})
#   Find image average.
#   @param [Hash] opts Set of options
#   @return [Float] Output value

# @!method min(, opts = {})
#   Find image minimum.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :size Number of minimum values to find
#   @option opts [Integer] :x Horizontal position of minimum
#   @option opts [Integer] :y Vertical position of minimum
#   @option opts [Array<Double>] :out_array Array of output values
#   @option opts [Array<Integer>] :x_array Array of horizontal positions
#   @option opts [Array<Integer>] :y_array Array of vertical positions
#   @return [Float] Output value

# @!method max(, opts = {})
#   Find image maximum.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :size Number of maximum values to find
#   @option opts [Integer] :x Horizontal position of maximum
#   @option opts [Integer] :y Vertical position of maximum
#   @option opts [Array<Double>] :out_array Array of output values
#   @option opts [Array<Integer>] :x_array Array of horizontal positions
#   @option opts [Array<Integer>] :y_array Array of vertical positions
#   @return [Float] Output value

# @!method deviate(, opts = {})
#   Find image standard deviation.
#   @param [Hash] opts Set of options
#   @return [Float] Output value

# @!method stats(, opts = {})
#   Find image average.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output array of statistics

# @!method hist_find(, opts = {})
#   Find image histogram.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :band Find histogram of band
#   @return [Vips::Image] Output histogram

# @!method hist_find_ndim(, opts = {})
#   Find n-dimensional image histogram.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :bins Number of bins in each dimension
#   @return [Vips::Image] Output histogram

# @!method hist_find_indexed(index, opts = {})
#   Find indexed image histogram.
#   @param index [Vips::Image] Index image
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output histogram

# @!method hough_line(, opts = {})
#   Find hough line transform.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :width horizontal size of parameter space
#   @option opts [Integer] :height Vertical size of parameter space
#   @return [Vips::Image] Output image

# @!method hough_circle(, opts = {})
#   Find hough circle transform.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :scale Scale down dimensions by this factor
#   @option opts [Integer] :min_radius Smallest radius to search for
#   @option opts [Integer] :max_radius Largest radius to search for
#   @return [Vips::Image] Output image

# @!method project(, opts = {})
#   Find image projections.
#   @param [Hash] opts Set of options
#   @return [Array<Vips::Image, Vips::Image>] Sums of columns, Sums of rows

# @!method profile(, opts = {})
#   Find image profiles.
#   @param [Hash] opts Set of options
#   @return [Array<Vips::Image, Vips::Image>] First non-zero pixel in column, First non-zero pixel in row

# @!method measure(h, v, opts = {})
#   Measure a set of patches on a colour chart.
#   @param h [Integer] Number of patches across chart
#   @param v [Integer] Number of patches down chart
#   @param [Hash] opts Set of options
#   @option opts [Integer] :left Left edge of extract area
#   @option opts [Integer] :top Top edge of extract area
#   @option opts [Integer] :width Width of extract area
#   @option opts [Integer] :height Height of extract area
#   @return [Vips::Image] Output array of statistics

# @!method getpoint(x, y, opts = {})
#   Read a point from an image.
#   @param x [Integer] Point to read
#   @param y [Integer] Point to read
#   @param [Hash] opts Set of options
#   @return [Array<Double>] Array of output values

# @!method copy(, opts = {})
#   Copy an image.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :width Image width in pixels
#   @option opts [Integer] :height Image height in pixels
#   @option opts [Integer] :bands Number of bands in image
#   @option opts [Vips::BandFormat] :format Pixel format in image
#   @option opts [Vips::Coding] :coding Pixel coding
#   @option opts [Vips::Interpretation] :interpretation Pixel interpretation
#   @option opts [Float] :xres Horizontal resolution in pixels/mm
#   @option opts [Float] :yres Vertical resolution in pixels/mm
#   @option opts [Integer] :xoffset Horizontal offset of origin
#   @option opts [Integer] :yoffset Vertical offset of origin
#   @return [Vips::Image] Output image

# @!method tilecache(, opts = {})
#   Cache an image as a set of tiles.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :tile_width Tile width in pixels
#   @option opts [Integer] :tile_height Tile height in pixels
#   @option opts [Integer] :max_tiles Maximum number of tiles to cache
#   @option opts [Vips::Access] :access Expected access pattern
#   @option opts [Boolean] :threaded Allow threaded access
#   @option opts [Boolean] :persistent Keep cache between evaluations
#   @return [Vips::Image] Output image

# @!method linecache(, opts = {})
#   Cache an image as a set of lines.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :tile_height Tile height in pixels
#   @option opts [Vips::Access] :access Expected access pattern
#   @option opts [Boolean] :threaded Allow threaded access
#   @option opts [Boolean] :persistent Keep cache between evaluations
#   @return [Vips::Image] Output image

# @!method sequential(, opts = {})
#   Check sequential access.
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :trace trace pixel requests
#   @option opts [Integer] :tile_height Tile height in pixels
#   @option opts [Vips::Access] :access Expected access pattern
#   @return [Vips::Image] Output image

# @!method cache(, opts = {})
#   Cache an image.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :tile_width Tile width in pixels
#   @option opts [Integer] :tile_height Tile height in pixels
#   @option opts [Integer] :max_tiles Maximum number of tiles to cache
#   @return [Vips::Image] Output image

# @!method embed(x, y, width, height, opts = {})
#   Embed an image in a larger image.
#   @param x [Integer] Left edge of input in output
#   @param y [Integer] Top edge of input in output
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param [Hash] opts Set of options
#   @option opts [Vips::Extend] :extend How to generate the extra pixels
#   @option opts [Array<Double>] :background Colour for background pixels
#   @return [Vips::Image] Output image

# @!method flip(direction, opts = {})
#   Flip an image.
#   @param direction [Vips::Direction] Direction to flip image
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method insert(sub, x, y, opts = {})
#   Insert image @sub into @main at @x, @y.
#   @param sub [Vips::Image] Sub-image to insert into main image
#   @param x [Integer] Left edge of sub in main
#   @param y [Integer] Top edge of sub in main
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :expand Expand output to hold all of both inputs
#   @option opts [Array<Double>] :background Colour for new pixels
#   @return [Vips::Image] Output image

# @!method join(in2, direction, opts = {})
#   Join a pair of images.
#   @param in2 [Vips::Image] Second input image
#   @param direction [Vips::Direction] Join left-right or up-down
#   @param [Hash] opts Set of options
#   @option opts [Vips::Align] :align Align on the low, centre or high coordinate edge
#   @option opts [Boolean] :expand Expand output to hold all of both inputs
#   @option opts [Integer] :shim Pixels between images
#   @option opts [Array<Double>] :background Colour for new pixels
#   @return [Vips::Image] Output image

# @!method self.arrayjoin(in, opts = {})
#   Join an array of images.
#   @param in [Array<Image>] Array of input images
#   @param [Hash] opts Set of options
#   @option opts [Integer] :across Number of images across grid
#   @option opts [Integer] :shim Pixels between images
#   @option opts [Array<Double>] :background Colour for new pixels
#   @option opts [Vips::Align] :halign Align on the left, centre or right
#   @option opts [Vips::Align] :valign Align on the top, centre or bottom
#   @option opts [Integer] :hspacing Horizontal spacing between images
#   @option opts [Integer] :vspacing Vertical spacing between images
#   @return [Vips::Image] Output image

# @!method extract_area(left, top, width, height, opts = {})
#   Extract an area from an image.
#   @param left [Integer] Left edge of extract area
#   @param top [Integer] Top edge of extract area
#   @param width [Integer] Width of extract area
#   @param height [Integer] Height of extract area
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method extract_area(left, top, width, height, opts = {})
#   Extract an area from an image.
#   @param left [Integer] Left edge of extract area
#   @param top [Integer] Top edge of extract area
#   @param width [Integer] Width of extract area
#   @param height [Integer] Height of extract area
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method extract_band(band, opts = {})
#   Extract band from an image.
#   @param band [Integer] Band to extract
#   @param [Hash] opts Set of options
#   @option opts [Integer] :n Number of bands to extract
#   @return [Vips::Image] Output image

# @!method bandjoin_const(c, opts = {})
#   Append a constant band to an image.
#   @param c [Array<Double>] Array of constants to add
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method self.bandrank(in, opts = {})
#   Band-wise rank of a set of images.
#   @param in [Array<Image>] Array of input images
#   @param [Hash] opts Set of options
#   @option opts [Integer] :index Select this band element from sorted list
#   @return [Vips::Image] Output image

# @!method bandmean(, opts = {})
#   Band-wise average.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method bandbool(boolean, opts = {})
#   Boolean operation across image bands.
#   @param boolean [Vips::OperationBoolean] boolean to perform
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method replicate(across, down, opts = {})
#   Replicate an image.
#   @param across [Integer] Repeat this many times horizontally
#   @param down [Integer] Repeat this many times vertically
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method cast(format, opts = {})
#   Cast an image.
#   @param format [Vips::BandFormat] Format to cast to
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :shift Shift integer values up and down
#   @return [Vips::Image] Output image

# @!method rot(angle, opts = {})
#   Rotate an image.
#   @param angle [Vips::Angle] Angle to rotate image
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method rot45(, opts = {})
#   Rotate an image.
#   @param [Hash] opts Set of options
#   @option opts [Vips::Angle45] :angle Angle to rotate image
#   @return [Vips::Image] Output image

# @!method autorot(, opts = {})
#   Autorotate image by exif tag.
#   @param [Hash] opts Set of options
#   @option opts [Vips::Angle] :angle Angle image was rotated by
#   @return [Vips::Image] Output image

# @!method recomb(m, opts = {})
#   Linear recombination with matrix.
#   @param m [Vips::Image] matrix of coefficients
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method bandfold(, opts = {})
#   Fold up x axis into bands.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :factor Fold by this factor
#   @return [Vips::Image] Output image

# @!method bandunfold(, opts = {})
#   Unfold image bands into x axis.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :factor Unfold by this factor
#   @return [Vips::Image] Output image

# @!method flatten(, opts = {})
#   Flatten alpha out of an image.
#   @param [Hash] opts Set of options
#   @option opts [Array<Double>] :background Background value
#   @option opts [Float] :max_alpha Maximum value of alpha channel
#   @return [Vips::Image] Output image

# @!method premultiply(, opts = {})
#   Premultiply image alpha.
#   @param [Hash] opts Set of options
#   @option opts [Float] :max_alpha Maximum value of alpha channel
#   @return [Vips::Image] Output image

# @!method unpremultiply(, opts = {})
#   Unpremultiply image alpha.
#   @param [Hash] opts Set of options
#   @option opts [Float] :max_alpha Maximum value of alpha channel
#   @return [Vips::Image] Output image

# @!method grid(tile_height, across, down, opts = {})
#   Grid an image.
#   @param tile_height [Integer] chop into tiles this high
#   @param across [Integer] number of tiles across
#   @param down [Integer] number of tiles down
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method scale(, opts = {})
#   Scale an image to uchar.
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :log Log scale
#   @option opts [Float] :exp Exponent for log scale
#   @return [Vips::Image] Output image

# @!method wrap(, opts = {})
#   Wrap image origin.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :x Left edge of input in output
#   @option opts [Integer] :y Top edge of input in output
#   @return [Vips::Image] Output image

# @!method zoom(xfac, yfac, opts = {})
#   Zoom an image.
#   @param xfac [Integer] Horizontal zoom factor
#   @param yfac [Integer] Vertical zoom factor
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method subsample(xfac, yfac, opts = {})
#   Subsample an image.
#   @param xfac [Integer] Horizontal subsample factor
#   @param yfac [Integer] Vertical subsample factor
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :point Point sample
#   @return [Vips::Image] Output image

# @!method msb(, opts = {})
#   Pick most-significant byte from an image.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :band Band to msb
#   @return [Vips::Image] Output image

# @!method byteswap(, opts = {})
#   Byteswap an image.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method falsecolour(, opts = {})
#   False-colour an image.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method gamma(, opts = {})
#   Gamma an image.
#   @param [Hash] opts Set of options
#   @option opts [Float] :exponent Gamma factor
#   @return [Vips::Image] Output image

# @!method self.black(width, height, opts = {})
#   Make a black image.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param [Hash] opts Set of options
#   @option opts [Integer] :bands Number of bands in image
#   @return [Vips::Image] Output image

# @!method self.gaussnoise(width, height, opts = {})
#   Make a gaussnoise image.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param [Hash] opts Set of options
#   @option opts [Float] :mean Mean of pixels in generated image
#   @option opts [Float] :sigma Standard deviation of pixels in generated image
#   @return [Vips::Image] Output image

# @!method self.text(text, opts = {})
#   Make a text image.
#   @param text [String] Text to render
#   @param [Hash] opts Set of options
#   @option opts [String] :font Font to render width
#   @option opts [Integer] :width Maximum image width in pixels
#   @option opts [Vips::Align] :align Align on the low, centre or high edge
#   @option opts [Integer] :dpi DPI to render at
#   @option opts [Integer] :spacing Line spacing
#   @return [Vips::Image] Output image

# @!method self.xyz(width, height, opts = {})
#   Make an image where pixel values are coordinates.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param [Hash] opts Set of options
#   @option opts [Integer] :csize Size of third dimension
#   @option opts [Integer] :dsize Size of fourth dimension
#   @option opts [Integer] :esize Size of fifth dimension
#   @return [Vips::Image] Output image

# @!method self.gaussmat(sigma, min_ampl, opts = {})
#   Make a gaussian image.
#   @param sigma [Float] Sigma of Gaussian
#   @param min_ampl [Float] Minimum amplitude of Gaussian
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :separable Generate separable Gaussian
#   @option opts [Vips::Precision] :precision Generate with this precision
#   @return [Vips::Image] Output image

# @!method self.logmat(sigma, min_ampl, opts = {})
#   Make a laplacian of gaussian image.
#   @param sigma [Float] Radius of Logmatian
#   @param min_ampl [Float] Minimum amplitude of Logmatian
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :separable Generate separable Logmatian
#   @option opts [Vips::Precision] :precision Generate with this precision
#   @return [Vips::Image] Output image

# @!method self.eye(width, height, opts = {})
#   Make an image showing the eye's spatial response.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :uchar Output an unsigned char image
#   @option opts [Float] :factor Maximum spatial frequency
#   @return [Vips::Image] Output image

# @!method self.grey(width, height, opts = {})
#   Make a grey ramp image.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :uchar Output an unsigned char image
#   @return [Vips::Image] Output image

# @!method self.zone(width, height, opts = {})
#   Make a zone plate.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :uchar Output an unsigned char image
#   @return [Vips::Image] Output image

# @!method self.sines(width, height, opts = {})
#   Make a 2d sine wave.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :uchar Output an unsigned char image
#   @option opts [Float] :hfreq Horizontal spatial frequency
#   @option opts [Float] :vfreq Vertical spatial frequency
#   @return [Vips::Image] Output image

# @!method self.mask_ideal(width, height, frequency_cutoff, opts = {})
#   Make an ideal filter.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param frequency_cutoff [Float] Frequency cutoff
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :uchar Output an unsigned char image
#   @option opts [Boolean] :nodc Remove DC component
#   @option opts [Boolean] :reject Invert the sense of the filter
#   @option opts [Boolean] :optical Rotate quadrants to optical space
#   @return [Vips::Image] Output image

# @!method self.mask_ideal_ring(width, height, frequency_cutoff, ringwidth, opts = {})
#   Make an ideal ring filter.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param frequency_cutoff [Float] Frequency cutoff
#   @param ringwidth [Float] Ringwidth
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :uchar Output an unsigned char image
#   @option opts [Boolean] :nodc Remove DC component
#   @option opts [Boolean] :reject Invert the sense of the filter
#   @option opts [Boolean] :optical Rotate quadrants to optical space
#   @return [Vips::Image] Output image

# @!method self.mask_ideal_band(width, height, frequency_cutoff_x, frequency_cutoff_y, radius, opts = {})
#   Make an ideal band filter.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param frequency_cutoff_x [Float] Frequency cutoff x
#   @param frequency_cutoff_y [Float] Frequency cutoff y
#   @param radius [Float] radius of circle
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :uchar Output an unsigned char image
#   @option opts [Boolean] :optical Rotate quadrants to optical space
#   @option opts [Boolean] :nodc Remove DC component
#   @option opts [Boolean] :reject Invert the sense of the filter
#   @return [Vips::Image] Output image

# @!method self.mask_butterworth(width, height, order, frequency_cutoff, amplitude_cutoff, opts = {})
#   Make a butterworth filter.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param order [Float] Filter order
#   @param frequency_cutoff [Float] Frequency cutoff
#   @param amplitude_cutoff [Float] Amplitude cutoff
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :uchar Output an unsigned char image
#   @option opts [Boolean] :optical Rotate quadrants to optical space
#   @option opts [Boolean] :nodc Remove DC component
#   @option opts [Boolean] :reject Invert the sense of the filter
#   @return [Vips::Image] Output image

# @!method self.mask_butterworth_ring(width, height, order, frequency_cutoff, amplitude_cutoff, ringwidth, opts = {})
#   Make a butterworth ring filter.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param order [Float] Filter order
#   @param frequency_cutoff [Float] Frequency cutoff
#   @param amplitude_cutoff [Float] Amplitude cutoff
#   @param ringwidth [Float] Ringwidth
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :uchar Output an unsigned char image
#   @option opts [Boolean] :optical Rotate quadrants to optical space
#   @option opts [Boolean] :nodc Remove DC component
#   @option opts [Boolean] :reject Invert the sense of the filter
#   @return [Vips::Image] Output image

# @!method self.mask_butterworth_band(width, height, order, frequency_cutoff_x, frequency_cutoff_y, radius, amplitude_cutoff, opts = {})
#   Make a butterworth_band filter.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param order [Float] Filter order
#   @param frequency_cutoff_x [Float] Frequency cutoff x
#   @param frequency_cutoff_y [Float] Frequency cutoff y
#   @param radius [Float] radius of circle
#   @param amplitude_cutoff [Float] Amplitude cutoff
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :uchar Output an unsigned char image
#   @option opts [Boolean] :optical Rotate quadrants to optical space
#   @option opts [Boolean] :reject Invert the sense of the filter
#   @option opts [Boolean] :nodc Remove DC component
#   @return [Vips::Image] Output image

# @!method self.mask_gaussian(width, height, frequency_cutoff, amplitude_cutoff, opts = {})
#   Make a gaussian filter.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param frequency_cutoff [Float] Frequency cutoff
#   @param amplitude_cutoff [Float] Amplitude cutoff
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :uchar Output an unsigned char image
#   @option opts [Boolean] :nodc Remove DC component
#   @option opts [Boolean] :reject Invert the sense of the filter
#   @option opts [Boolean] :optical Rotate quadrants to optical space
#   @return [Vips::Image] Output image

# @!method self.mask_gaussian_ring(width, height, frequency_cutoff, amplitude_cutoff, ringwidth, opts = {})
#   Make a gaussian ring filter.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param frequency_cutoff [Float] Frequency cutoff
#   @param amplitude_cutoff [Float] Amplitude cutoff
#   @param ringwidth [Float] Ringwidth
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :uchar Output an unsigned char image
#   @option opts [Boolean] :optical Rotate quadrants to optical space
#   @option opts [Boolean] :nodc Remove DC component
#   @option opts [Boolean] :reject Invert the sense of the filter
#   @return [Vips::Image] Output image

# @!method self.mask_gaussian_band(width, height, frequency_cutoff_x, frequency_cutoff_y, radius, amplitude_cutoff, opts = {})
#   Make a gaussian filter.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param frequency_cutoff_x [Float] Frequency cutoff x
#   @param frequency_cutoff_y [Float] Frequency cutoff y
#   @param radius [Float] radius of circle
#   @param amplitude_cutoff [Float] Amplitude cutoff
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :uchar Output an unsigned char image
#   @option opts [Boolean] :optical Rotate quadrants to optical space
#   @option opts [Boolean] :nodc Remove DC component
#   @option opts [Boolean] :reject Invert the sense of the filter
#   @return [Vips::Image] Output image

# @!method self.mask_fractal(width, height, fractal_dimension, opts = {})
#   Make fractal filter.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param fractal_dimension [Float] Fractal dimension
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :uchar Output an unsigned char image
#   @option opts [Boolean] :nodc Remove DC component
#   @option opts [Boolean] :reject Invert the sense of the filter
#   @option opts [Boolean] :optical Rotate quadrants to optical space
#   @return [Vips::Image] Output image

# @!method buildlut(, opts = {})
#   Build a look-up table.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method invertlut(, opts = {})
#   Build an inverted look-up table.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :size LUT size to generate
#   @return [Vips::Image] Output image

# @!method self.tonelut(, opts = {})
#   Build a look-up table.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :in_max Size of LUT to build
#   @option opts [Integer] :out_max Maximum value in output LUT
#   @option opts [Float] :Lb Lowest value in output
#   @option opts [Float] :Lw Highest value in output
#   @option opts [Float] :Ps Position of shadow
#   @option opts [Float] :Pm Position of mid-tones
#   @option opts [Float] :Ph Position of highlights
#   @option opts [Float] :S Adjust shadows by this much
#   @option opts [Float] :M Adjust mid-tones by this much
#   @option opts [Float] :H Adjust highlights by this much
#   @return [Vips::Image] Output image

# @!method self.identity(, opts = {})
#   Make a 1d image where pixel values are indexes.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :bands Number of bands in LUT
#   @option opts [Boolean] :ushort Create a 16-bit LUT
#   @option opts [Integer] :size Size of 16-bit LUT
#   @return [Vips::Image] Output image

# @!method self.fractsurf(width, height, fractal_dimension, opts = {})
#   Make a fractal surface.
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param fractal_dimension [Float] Fractal dimension
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method self.radload(filename, opts = {})
#   Load a radiance image from a file.
#   @param filename [String] Filename to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.ppmload(filename, opts = {})
#   Load ppm from file.
#   @param filename [String] Filename to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.csvload(filename, opts = {})
#   Load csv from file.
#   @param filename [String] Filename to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Integer] :skip Skip this many lines at the start of the file
#   @option opts [Integer] :lines Read this many lines from the file
#   @option opts [String] :whitespace Set of whitespace characters
#   @option opts [String] :separator Set of separator characters
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.matrixload(filename, opts = {})
#   Load matrix from file.
#   @param filename [String] Filename to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.analyzeload(filename, opts = {})
#   Load an analyze6 image.
#   @param filename [String] Filename to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.rawload(filename, width, height, bands, opts = {})
#   Load raw data from a file.
#   @param filename [String] Filename to load from
#   @param width [Integer] Image width in pixels
#   @param height [Integer] Image height in pixels
#   @param bands [Integer] Number of bands in image
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Integer] :offset Offset in bytes from start of file
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.vipsload(filename, opts = {})
#   Load vips from file.
#   @param filename [String] Filename to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.pngload(filename, opts = {})
#   Load png from file.
#   @param filename [String] Filename to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.pngload_buffer(buffer, opts = {})
#   Load png from buffer.
#   @param buffer [Vips::Blob] Buffer to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.matload(filename, opts = {})
#   Load mat from file.
#   @param filename [String] Filename to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.jpegload(filename, opts = {})
#   Load jpeg from file.
#   @param filename [String] Filename to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Integer] :shrink Shrink factor on load
#   @option opts [Boolean] :fail Fail on first warning
#   @option opts [Boolean] :autorotate Rotate image using exif orientation
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.jpegload_buffer(buffer, opts = {})
#   Load jpeg from buffer.
#   @param buffer [Vips::Blob] Buffer to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Integer] :shrink Shrink factor on load
#   @option opts [Boolean] :fail Fail on first warning
#   @option opts [Boolean] :autorotate Rotate image using exif orientation
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.webpload(filename, opts = {})
#   Load webp from file.
#   @param filename [String] Filename to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.webpload_buffer(buffer, opts = {})
#   Load webp from buffer.
#   @param buffer [Vips::Blob] Buffer to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.tiffload(filename, opts = {})
#   Load tiff from file.
#   @param filename [String] Filename to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Integer] :page Load this page from the image
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.tiffload_buffer(buffer, opts = {})
#   Load tiff from buffer.
#   @param buffer [Vips::Blob] Buffer to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Integer] :page Load this page from the image
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.openslideload(filename, opts = {})
#   Load file with openslide.
#   @param filename [String] Filename to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Integer] :level Load this level from the file
#   @option opts [Boolean] :autocrop Crop to image bounds
#   @option opts [String] :associated Load this associated image
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.magickload(filename, opts = {})
#   Load file with imagemagick.
#   @param filename [String] Filename to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :all_frames Read all frames from an image
#   @option opts [String] :density Canvas resolution for rendering vector formats like SVG
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.magickload_buffer(buffer, opts = {})
#   Load buffer with imagemagick.
#   @param buffer [Vips::Blob] Buffer to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :all_frames Read all frames from an image
#   @option opts [String] :density Canvas resolution for rendering vector formats like SVG
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.fitsload(filename, opts = {})
#   Load a fits image.
#   @param filename [String] Filename to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method self.openexrload(filename, opts = {})
#   Load an openexr image.
#   @param filename [String] Filename to load from
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :disc Open to disc
#   @option opts [Vips::Access] :access Required access pattern for this file
#   @option opts [Vips::ForeignFlags] :flags Flags for this file
#   @return [Vips::Image] Output image

# @!method radsave(filename, opts = {})
#   Save image to radiance file.
#   @param filename [String] Filename to save to
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [] 

# @!method ppmsave(filename, opts = {})
#   Save image to ppm file.
#   @param filename [String] Filename to save to
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :ascii save as ascii
#   @option opts [Boolean] :squash save as one bit
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [] 

# @!method csvsave(filename, opts = {})
#   Save image to csv file.
#   @param filename [String] Filename to save to
#   @param [Hash] opts Set of options
#   @option opts [String] :separator Separator characters
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [] 

# @!method matrixsave(filename, opts = {})
#   Save image to matrix file.
#   @param filename [String] Filename to save to
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [] 

# @!method matrixprint(, opts = {})
#   Print matrix.
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [] 

# @!method rawsave(filename, opts = {})
#   Save image to raw file.
#   @param filename [String] Filename to save to
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [] 

# @!method rawsave_fd(fd, opts = {})
#   Write raw image to file descriptor.
#   @param fd [Integer] File descriptor to write to
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [] 

# @!method vipssave(filename, opts = {})
#   Save image to vips file.
#   @param filename [String] Filename to save to
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [] 

# @!method dzsave(filename, opts = {})
#   Save image to deep zoom format.
#   @param filename [String] Filename to save to
#   @param [Hash] opts Set of options
#   @option opts [Vips::ForeignDzLayout] :layout Directory layout
#   @option opts [String] :suffix Filename suffix for tiles
#   @option opts [Integer] :overlap Tile overlap in pixels
#   @option opts [Integer] :tile_size Tile size in pixels
#   @option opts [Boolean] :centre Center image in tile
#   @option opts [Vips::ForeignDzDepth] :depth Pyramid depth
#   @option opts [Vips::Angle] :angle Rotate image during save
#   @option opts [Vips::ForeignDzContainer] :container Pyramid container type
#   @option opts [Boolean] :properties Write a properties file to the output directory
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [] 

# @!method pngsave(filename, opts = {})
#   Save image to png file.
#   @param filename [String] Filename to save to
#   @param [Hash] opts Set of options
#   @option opts [Integer] :compression Compression factor
#   @option opts [Boolean] :interlace Interlace image
#   @option opts [String] :profile ICC profile to embed
#   @option opts [Vips::ForeignPngFilter] :filter libpng row filter flag(s)
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [] 

# @!method pngsave_buffer(, opts = {})
#   Save image to png buffer.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :compression Compression factor
#   @option opts [Boolean] :interlace Interlace image
#   @option opts [String] :profile ICC profile to embed
#   @option opts [Vips::ForeignPngFilter] :filter libpng row filter flag(s)
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [Vips::Blob] Buffer to save to

# @!method jpegsave(filename, opts = {})
#   Save image to jpeg file.
#   @param filename [String] Filename to save to
#   @param [Hash] opts Set of options
#   @option opts [Integer] :Q Q factor
#   @option opts [String] :profile ICC profile to embed
#   @option opts [Boolean] :optimize_coding Compute optimal Huffman coding tables
#   @option opts [Boolean] :interlace Generate an interlaced (progressive) jpeg
#   @option opts [Boolean] :no_subsample Disable chroma subsample
#   @option opts [Boolean] :trellis_quant Apply trellis quantisation to each 8x8 block
#   @option opts [Boolean] :overshoot_deringing Apply overshooting to samples with extreme values
#   @option opts [Boolean] :optimize_scans Split the spectrum of DCT coefficients into separate scans
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [] 

# @!method jpegsave_buffer(, opts = {})
#   Save image to jpeg buffer.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :Q Q factor
#   @option opts [String] :profile ICC profile to embed
#   @option opts [Boolean] :optimize_coding Compute optimal Huffman coding tables
#   @option opts [Boolean] :interlace Generate an interlaced (progressive) jpeg
#   @option opts [Boolean] :no_subsample Disable chroma subsample
#   @option opts [Boolean] :trellis_quant Apply trellis quantisation to each 8x8 block
#   @option opts [Boolean] :overshoot_deringing Apply overshooting to samples with extreme values
#   @option opts [Boolean] :optimize_scans Split the spectrum of DCT coefficients into separate scans
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [Vips::Blob] Buffer to save to

# @!method jpegsave_mime(, opts = {})
#   Save image to jpeg mime.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :Q Q factor
#   @option opts [String] :profile ICC profile to embed
#   @option opts [Boolean] :optimize_coding Compute optimal Huffman coding tables
#   @option opts [Boolean] :interlace Generate an interlaced (progressive) jpeg
#   @option opts [Boolean] :no_subsample Disable chroma subsample
#   @option opts [Boolean] :trellis_quant Apply trellis quantisation to each 8x8 block
#   @option opts [Boolean] :overshoot_deringing Apply overshooting to samples with extreme values
#   @option opts [Boolean] :optimize_scans Split the spectrum of DCT coefficients into separate scans
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [] 

# @!method webpsave(filename, opts = {})
#   Save image to webp file.
#   @param filename [String] Filename to save to
#   @param [Hash] opts Set of options
#   @option opts [Integer] :Q Q factor
#   @option opts [Boolean] :lossless enable lossless compression
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [] 

# @!method webpsave_buffer(, opts = {})
#   Save image to webp buffer.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :Q Q factor
#   @option opts [Boolean] :lossless enable lossless compression
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [Vips::Blob] Buffer to save to

# @!method tiffsave(filename, opts = {})
#   Save image to tiff file.
#   @param filename [String] Filename to save to
#   @param [Hash] opts Set of options
#   @option opts [Vips::ForeignTiffCompression] :compression Compression for this file
#   @option opts [Integer] :Q Q factor
#   @option opts [Vips::ForeignTiffPredictor] :predictor Compression prediction
#   @option opts [String] :profile ICC profile to embed
#   @option opts [Boolean] :tile Write a tiled tiff
#   @option opts [Integer] :tile_width Tile width in pixels
#   @option opts [Integer] :tile_height Tile height in pixels
#   @option opts [Boolean] :pyramid Write a pyramidal tiff
#   @option opts [Boolean] :miniswhite Use 0 for white in 1-bit images
#   @option opts [Boolean] :squash Squash images down to 1 bit
#   @option opts [Vips::ForeignTiffResunit] :resunit Resolution unit
#   @option opts [Float] :xres Horizontal resolution in pixels/mm
#   @option opts [Float] :yres Vertical resolution in pixels/mm
#   @option opts [Boolean] :bigtiff Write a bigtiff image
#   @option opts [Boolean] :properties Write a properties document to IMAGEDESCRIPTION
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [] 

# @!method fitssave(filename, opts = {})
#   Save image to fits file.
#   @param filename [String] Filename to save to
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :strip Strip all metadata from image
#   @option opts [Array<Double>] :background Background value
#   @return [] 

# @!method mapim(index, opts = {})
#   Resample with an mapim image.
#   @param index [Vips::Image] Index pixels with this
#   @param [Hash] opts Set of options
#   @option opts [Vips::Interpolate] :interpolate Interpolate pixels with this
#   @return [Vips::Image] Output image

# @!method shrink(xshrink, yshrink, opts = {})
#   Shrink an image.
#   @param xshrink [Float] Horizontal shrink factor
#   @param yshrink [Float] Vertical shrink factor
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method shrinkh(xshrink, opts = {})
#   Shrink an image horizontally.
#   @param xshrink [Integer] Horizontal shrink factor
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method shrinkv(yshrink, opts = {})
#   Shrink an image vertically.
#   @param yshrink [Integer] Vertical shrink factor
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method shrink2(xshrink, yshrink, opts = {})
#   Shrink an image.
#   @param xshrink [Float] Horizontal shrink factor
#   @param yshrink [Float] Vertical shrink factor
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method quadratic(coeff, opts = {})
#   Resample an image with a quadratic transform.
#   @param coeff [Vips::Image] Coefficient matrix
#   @param [Hash] opts Set of options
#   @option opts [Vips::Interpolate] :interpolate Interpolate values with this
#   @return [Vips::Image] Output image

# @!method affine(matrix, opts = {})
#   Affine transform of an image.
#   @param matrix [Array<Double>] Transformation matrix
#   @param [Hash] opts Set of options
#   @option opts [Vips::Interpolate] :interpolate Interpolate pixels with this
#   @option opts [Array<Integer>] :oarea Area of output to generate
#   @option opts [Float] :odx Horizontal output displacement
#   @option opts [Float] :ody Vertical output displacement
#   @option opts [Float] :idx Horizontal input displacement
#   @option opts [Float] :idy Vertical input displacement
#   @return [Vips::Image] Output image

# @!method similarity(, opts = {})
#   Similarity transform of an image.
#   @param [Hash] opts Set of options
#   @option opts [Vips::Interpolate] :interpolate Interpolate pixels with this
#   @option opts [Float] :scale Scale by this factor
#   @option opts [Float] :angle Rotate anticlockwise by this many degrees
#   @option opts [Float] :odx Horizontal output displacement
#   @option opts [Float] :ody Vertical output displacement
#   @option opts [Float] :idx Horizontal input displacement
#   @option opts [Float] :idy Vertical input displacement
#   @return [Vips::Image] Output image

# @!method resize(scale, opts = {})
#   Resize an image.
#   @param scale [Float] Scale image by this factor
#   @param [Hash] opts Set of options
#   @option opts [Vips::Interpolate] :interpolate Interpolate pixels with this
#   @option opts [Float] :vscale Vertical scale image by this factor
#   @option opts [Float] :idx Horizontal input displacement
#   @option opts [Float] :idy Vertical input displacement
#   @return [Vips::Image] Output image

# @!method colourspace(space, opts = {})
#   Convert to a new colourspace.
#   @param space [Vips::Interpretation] Destination colour space
#   @param [Hash] opts Set of options
#   @option opts [Vips::Interpretation] :source_space Source colour space
#   @return [Vips::Image] Output image

# @!method Lab2XYZ(, opts = {})
#   Transform cielab to xyz.
#   @param [Hash] opts Set of options
#   @option opts [Array<Double>] :temp Colour temperature
#   @return [Vips::Image] Output image

# @!method XYZ2Lab(, opts = {})
#   Transform xyz to lab.
#   @param [Hash] opts Set of options
#   @option opts [Array<Double>] :temp Colour temperature
#   @return [Vips::Image] Output image

# @!method Lab2LCh(, opts = {})
#   Transform lab to lch.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method LCh2Lab(, opts = {})
#   Transform lch to lab.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method LCh2CMC(, opts = {})
#   Transform lch to cmc.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method CMC2LCh(, opts = {})
#   Transform lch to cmc.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method XYZ2Yxy(, opts = {})
#   Transform xyz to yxy.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method Yxy2XYZ(, opts = {})
#   Transform yxy to xyz.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method scRGB2XYZ(, opts = {})
#   Transform scrgb to xyz.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method XYZ2scRGB(, opts = {})
#   Transform xyz to scrgb.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method LabQ2Lab(, opts = {})
#   Unpack a labq image to float lab.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method Lab2LabQ(, opts = {})
#   Transform float lab to labq coding.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method LabQ2LabS(, opts = {})
#   Unpack a labq image to short lab.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method LabS2LabQ(, opts = {})
#   Transform short lab to labq coding.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method LabS2Lab(, opts = {})
#   Transform signed short lab to float.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method Lab2LabS(, opts = {})
#   Transform float lab to signed short.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method rad2float(, opts = {})
#   Unpack radiance coding to float rgb.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method float2rad(, opts = {})
#   Transform float rgb to radiance coding.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method LabQ2sRGB(, opts = {})
#   Convert a labq image to srgb.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method sRGB2HSV(, opts = {})
#   Transform srgb to hsv.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method HSV2sRGB(, opts = {})
#   Transform hsv to srgb.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method icc_import(, opts = {})
#   Import from device with icc profile.
#   @param [Hash] opts Set of options
#   @option opts [Vips::PCS] :pcs Set Profile Connection Space
#   @option opts [Vips::Intent] :intent Rendering intent
#   @option opts [Boolean] :embedded Use embedded input profile, if available
#   @option opts [String] :input_profile Filename to load input profile from
#   @return [Vips::Image] Output image

# @!method icc_export(, opts = {})
#   Output to device with icc profile.
#   @param [Hash] opts Set of options
#   @option opts [Vips::PCS] :pcs Set Profile Connection Space
#   @option opts [Vips::Intent] :intent Rendering intent
#   @option opts [String] :output_profile Filename to load output profile from
#   @option opts [Integer] :depth Output device space depth in bits
#   @return [Vips::Image] Output image

# @!method icc_transform(output_profile, opts = {})
#   Transform between devices with icc profiles.
#   @param output_profile [String] Filename to load output profile from
#   @param [Hash] opts Set of options
#   @option opts [Vips::PCS] :pcs Set Profile Connection Space
#   @option opts [Vips::Intent] :intent Rendering intent
#   @option opts [Boolean] :embedded Use embedded input profile, if available
#   @option opts [String] :input_profile Filename to load input profile from
#   @option opts [Integer] :depth Output device space depth in bits
#   @return [Vips::Image] Output image

# @!method dE76(right, opts = {})
#   Calculate de76.
#   @param right [Vips::Image] Right-hand input image
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method dE00(right, opts = {})
#   Calculate de00.
#   @param right [Vips::Image] Right-hand input image
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method dECMC(right, opts = {})
#   Calculate decmc.
#   @param right [Vips::Image] Right-hand input image
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method sRGB2scRGB(, opts = {})
#   Convert an srgb image to scrgb.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method scRGB2BW(, opts = {})
#   Convert scrgb to bw.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :depth Output device space depth in bits
#   @return [Vips::Image] Output image

# @!method scRGB2sRGB(, opts = {})
#   Convert an scrgb image to srgb.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :depth Output device space depth in bits
#   @return [Vips::Image] Output image

# @!method maplut(lut, opts = {})
#   Map an image though a lut.
#   @param lut [Vips::Image] Look-up table image
#   @param [Hash] opts Set of options
#   @option opts [Integer] :band apply one-band lut to this band of in
#   @return [Vips::Image] Output image

# @!method percent(percent, opts = {})
#   Find threshold for percent of pixels.
#   @param percent [Float] Percent of pixels
#   @param [Hash] opts Set of options
#   @return [Integer] Threshold above which lie percent of pixels

# @!method stdif(width, height, opts = {})
#   Statistical difference.
#   @param width [Integer] Window width in pixels
#   @param height [Integer] Window height in pixels
#   @param [Hash] opts Set of options
#   @option opts [Float] :a Weight of new mean
#   @option opts [Float] :s0 New deviation
#   @option opts [Float] :b Weight of new deviation
#   @option opts [Float] :m0 New mean
#   @return [Vips::Image] Output image

# @!method hist_cum(, opts = {})
#   Form cumulative histogram.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method hist_match(ref, opts = {})
#   Match two histograms.
#   @param ref [Vips::Image] Reference histogram
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method hist_norm(, opts = {})
#   Normalise histogram.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method hist_equal(, opts = {})
#   Histogram equalisation.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :band Equalise with this band
#   @return [Vips::Image] Output image

# @!method hist_plot(, opts = {})
#   Plot histogram.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method hist_local(width, height, opts = {})
#   Local histogram equalisation.
#   @param width [Integer] Window width in pixels
#   @param height [Integer] Window height in pixels
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method hist_ismonotonic(, opts = {})
#   Test for monotonicity.
#   @param [Hash] opts Set of options
#   @return [Boolean] true if in is monotonic

# @!method hist_entropy(, opts = {})
#   Estimate image entropy.
#   @param [Hash] opts Set of options
#   @return [Float] Output value

# @!method conv(mask, opts = {})
#   Convolution operation.
#   @param mask [Vips::Image] Input matrix image
#   @param [Hash] opts Set of options
#   @option opts [Vips::Precision] :precision Convolve with this precision
#   @option opts [Integer] :layers Use this many layers in approximation
#   @option opts [Integer] :cluster Cluster lines closer than this in approximation
#   @return [Vips::Image] Output image

# @!method compass(mask, opts = {})
#   Convolve with rotating mask.
#   @param mask [Vips::Image] Input matrix image
#   @param [Hash] opts Set of options
#   @option opts [Integer] :times Rotate and convolve this many times
#   @option opts [Vips::Angle45] :angle Rotate mask by this much between convolutions
#   @option opts [Vips::Combine] :combine Combine convolution results like this
#   @option opts [Vips::Precision] :precision Convolve with this precision
#   @option opts [Integer] :layers Use this many layers in approximation
#   @option opts [Integer] :cluster Cluster lines closer than this in approximation
#   @return [Vips::Image] Output image

# @!method convsep(mask, opts = {})
#   Seperable convolution operation.
#   @param mask [Vips::Image] Input matrix image
#   @param [Hash] opts Set of options
#   @option opts [Vips::Precision] :precision Convolve with this precision
#   @option opts [Integer] :layers Use this many layers in approximation
#   @option opts [Integer] :cluster Cluster lines closer than this in approximation
#   @return [Vips::Image] Output image

# @!method fastcor(ref, opts = {})
#   Fast correlation.
#   @param ref [Vips::Image] Input reference image
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method spcor(ref, opts = {})
#   Spatial correlation.
#   @param ref [Vips::Image] Input reference image
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method sharpen(, opts = {})
#   Unsharp masking for print.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :radius Mask radius
#   @option opts [Float] :x1 Flat/jaggy threshold
#   @option opts [Float] :y2 Maximum brightening
#   @option opts [Float] :y3 Maximum darkening
#   @option opts [Float] :m1 Slope for flat areas
#   @option opts [Float] :m2 Slope for jaggy areas
#   @return [Vips::Image] Output image

# @!method gaussblur(sigma, opts = {})
#   Gaussian blur.
#   @param sigma [Float] Sigma of Gaussian
#   @param [Hash] opts Set of options
#   @option opts [Float] :min_ampl Minimum amplitude of Gaussian
#   @option opts [Vips::Precision] :precision Convolve with this precision
#   @return [Vips::Image] Output image

# @!method fwfft(, opts = {})
#   Forward fft.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method invfft(, opts = {})
#   Inverse fft.
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :real Output only the real part of the transform
#   @return [Vips::Image] Output image

# @!method freqmult(mask, opts = {})
#   Frequency-domain filtering.
#   @param mask [Vips::Image] Input mask image
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method spectrum(, opts = {})
#   Make displayable power spectrum.
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method phasecor(in2, opts = {})
#   Calculate phase correlation.
#   @param in2 [Vips::Image] Second input image
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method morph(mask, morph, opts = {})
#   Morphology operation.
#   @param mask [Vips::Image] Input matrix image
#   @param morph [Vips::OperationMorphology] Morphological operation to perform
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method rank(width, height, index, opts = {})
#   Rank filter.
#   @param width [Integer] Window width in pixels
#   @param height [Integer] Window height in pixels
#   @param index [Integer] Select pixel at index
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Output image

# @!method countlines(direction, opts = {})
#   Count lines in an image.
#   @param direction [Vips::Direction] Countlines left-right or up-down
#   @param [Hash] opts Set of options
#   @return [Float] Number of lines

# @!method labelregions(, opts = {})
#   Label regions in an image.
#   @param [Hash] opts Set of options
#   @option opts [Integer] :segments Number of discrete contigious regions
#   @return [Vips::Image] Mask of region labels

# @!method draw_rect(ink, left, top, width, height, opts = {})
#   Paint a rectangle on an image.
#   @param ink [Array<Double>] Colour for pixels
#   @param left [Integer] Rect to fill
#   @param top [Integer] Rect to fill
#   @param width [Integer] Rect to fill
#   @param height [Integer] Rect to fill
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :fill Draw a solid object
#   @return [Vips::Image] Image to draw on

# @!method draw_mask(ink, mask, x, y, opts = {})
#   Draw a mask on an image.
#   @param ink [Array<Double>] Colour for pixels
#   @param mask [Vips::Image] Mask of pixels to draw
#   @param x [Integer] Draw mask here
#   @param y [Integer] Draw mask here
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Image to draw on

# @!method draw_line(ink, x1, y1, x2, y2, opts = {})
#   Draw a line on an image.
#   @param ink [Array<Double>] Colour for pixels
#   @param x1 [Integer] Start of draw_line
#   @param y1 [Integer] Start of draw_line
#   @param x2 [Integer] End of draw_line
#   @param y2 [Integer] End of draw_line
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Image to draw on

# @!method draw_circle(ink, cx, cy, radius, opts = {})
#   Draw a circle on an image.
#   @param ink [Array<Double>] Colour for pixels
#   @param cx [Integer] Centre of draw_circle
#   @param cy [Integer] Centre of draw_circle
#   @param radius [Integer] Radius in pixels
#   @param [Hash] opts Set of options
#   @option opts [Boolean] :fill Draw a solid object
#   @return [Vips::Image] Image to draw on

# @!method draw_flood(ink, x, y, opts = {})
#   Flood-fill an area.
#   @param ink [Array<Double>] Colour for pixels
#   @param x [Integer] DrawFlood start point
#   @param y [Integer] DrawFlood start point
#   @param [Hash] opts Set of options
#   @option opts [Vips::Image] :test Test pixels in this image
#   @option opts [Boolean] :equal DrawFlood while equal to edge
#   @option opts [Integer] :left Left edge of modified area
#   @option opts [Integer] :top top edge of modified area
#   @option opts [Integer] :width width of modified area
#   @option opts [Integer] :height height of modified area
#   @return [Vips::Image] Image to draw on

# @!method draw_image(sub, x, y, opts = {})
#   Paint an image into another image.
#   @param sub [Vips::Image] Sub-image to insert into main image
#   @param x [Integer] Draw image here
#   @param y [Integer] Draw image here
#   @param [Hash] opts Set of options
#   @option opts [Vips::CombineMode] :mode Combining mode
#   @return [Vips::Image] Image to draw on

# @!method draw_smudge(left, top, width, height, opts = {})
#   Blur a rectangle on an image.
#   @param left [Integer] Rect to fill
#   @param top [Integer] Rect to fill
#   @param width [Integer] Rect to fill
#   @param height [Integer] Rect to fill
#   @param [Hash] opts Set of options
#   @return [Vips::Image] Image to draw on

# @!method merge(sec, direction, dx, dy, opts = {})
#   Merge two images.
#   @param sec [Vips::Image] Secondary image
#   @param direction [Vips::Direction] Horizontal or vertcial merge
#   @param dx [Integer] Horizontal displacement from sec to ref
#   @param dy [Integer] Vertical displacement from sec to ref
#   @param [Hash] opts Set of options
#   @option opts [Integer] :mblend Maximum blend size
#   @return [Vips::Image] Output image

# @!method mosaic(sec, direction, xref, yref, xsec, ysec, opts = {})
#   Mosaic two images.
#   @param sec [Vips::Image] Secondary image
#   @param direction [Vips::Direction] Horizontal or vertcial mosaic
#   @param xref [Integer] Position of reference tie-point
#   @param yref [Integer] Position of reference tie-point
#   @param xsec [Integer] Position of secondary tie-point
#   @param ysec [Integer] Position of secondary tie-point
#   @param [Hash] opts Set of options
#   @option opts [Integer] :hwindow Half window size
#   @option opts [Integer] :harea Half area size
#   @option opts [Integer] :mblend Maximum blend size
#   @option opts [Integer] :bandno Band to search for features on
#   @option opts [Integer] :dx0 Detected integer offset
#   @option opts [Integer] :dy0 Detected integer offset
#   @option opts [Float] :scale1 Detected scale
#   @option opts [Float] :angle1 Detected rotation
#   @option opts [Float] :dx1 Detected first-order displacement
#   @option opts [Float] :dy1 Detected first-order displacement
#   @return [Vips::Image] Output image

# @!method mosaic1(sec, direction, xr1, yr1, xs1, ys1, xr2, yr2, xs2, ys2, opts = {})
#   First-order mosaic of two images.
#   @param sec [Vips::Image] Secondary image
#   @param direction [Vips::Direction] Horizontal or vertcial mosaic
#   @param xr1 [Integer] Position of first reference tie-point
#   @param yr1 [Integer] Position of first reference tie-point
#   @param xs1 [Integer] Position of first secondary tie-point
#   @param ys1 [Integer] Position of first secondary tie-point
#   @param xr2 [Integer] Position of second reference tie-point
#   @param yr2 [Integer] Position of second reference tie-point
#   @param xs2 [Integer] Position of second secondary tie-point
#   @param ys2 [Integer] Position of second secondary tie-point
#   @param [Hash] opts Set of options
#   @option opts [Integer] :hwindow Half window size
#   @option opts [Integer] :harea Half area size
#   @option opts [Boolean] :search Search to improve tie-points
#   @option opts [Vips::Interpolate] :interpolate Interpolate pixels with this
#   @option opts [Integer] :mblend Maximum blend size
#   @option opts [Integer] :bandno Band to search for features on
#   @return [Vips::Image] Output image

# @!method match(sec, xr1, yr1, xs1, ys1, xr2, yr2, xs2, ys2, opts = {})
#   First-order match of two images.
#   @param sec [Vips::Image] Secondary image
#   @param xr1 [Integer] Position of first reference tie-point
#   @param yr1 [Integer] Position of first reference tie-point
#   @param xs1 [Integer] Position of first secondary tie-point
#   @param ys1 [Integer] Position of first secondary tie-point
#   @param xr2 [Integer] Position of second reference tie-point
#   @param yr2 [Integer] Position of second reference tie-point
#   @param xs2 [Integer] Position of second secondary tie-point
#   @param ys2 [Integer] Position of second secondary tie-point
#   @param [Hash] opts Set of options
#   @option opts [Integer] :hwindow Half window size
#   @option opts [Integer] :harea Half area size
#   @option opts [Boolean] :search Search to improve tie-points
#   @option opts [Vips::Interpolate] :interpolate Interpolate pixels with this
#   @return [Vips::Image] Output image

# @!method globalbalance(, opts = {})
#   Global balance an image mosaic.
#   @param [Hash] opts Set of options
#   @option opts [Float] :gamma Image gamma
#   @option opts [Boolean] :int_output Integer output
#   @return [Vips::Image] Output image

  end
end
