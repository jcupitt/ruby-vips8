#--
# This file generated automatically. Do not edit!
#++


module Vips
  class Image

# @!method self.system(cmd_format, opts = {})
#   Run an external command.
#   @param cmd_format [String] Command to run
#   @param [Hash] opts set of options
#   @option opts [Array<Image>] :in Array of input images
#   @option opts [String] :in_format Format for input filename
#   @option opts [String] :out_format Format for output filename
#   @return [Image, String] Output image, Command log

# @!method add(right, opts = {})
#   Add two images.
#   @param right [Image] Right-hand image argument
#   @param [Hash] opts set of options
#   @return [Image] Output image

##
# :method: subtract
# :call-seq:
#    subtract(right) => out
#
# Subtract two images.
#
# Input:
# [right] Right-hand image argument, input VipsImage
#
# Output:
# [out] Output image, output VipsImage

##
# :method: multiply
# :call-seq:
#    multiply(right) => out
#
# Multiply two images.
#
# Input:
# [right] Right-hand image argument, input VipsImage
#
# Output:
# [out] Output image, output VipsImage

##
# :method: divide
# :call-seq:
#    divide(right) => out
#
# Divide two images.
#
# Input:
# [right] Right-hand image argument, input VipsImage
#
# Output:
# [out] Output image, output VipsImage

##
# :method: relational
# :call-seq:
#    relational(right, relational) => out
#
# Relational operation on two images.
#
# Input:
# [right] Right-hand image argument, input VipsImage
# [relational] relational to perform, input VipsOperationRelational
#
# Output:
# [out] Output image, output VipsImage

##
# :method: remainder
# :call-seq:
#    remainder(right) => out
#
# Remainder after integer division of two images.
#
# Input:
# [right] Right-hand image argument, input VipsImage
#
# Output:
# [out] Output image, output VipsImage

##
# :method: boolean
# :call-seq:
#    boolean(right, boolean) => out
#
# Boolean operation on two images.
#
# Input:
# [right] Right-hand image argument, input VipsImage
# [boolean] boolean to perform, input VipsOperationBoolean
#
# Output:
# [out] Output image, output VipsImage

##
# :method: math2
# :call-seq:
#    math2(right, math2) => out
#
# Binary math operations.
#
# Input:
# [right] Right-hand image argument, input VipsImage
# [math2] math to perform, input VipsOperationMath2
#
# Output:
# [out] Output image, output VipsImage

##
# :method: complex2
# :call-seq:
#    complex2(right, cmplx) => out
#
# Complex binary operations on two images.
#
# Input:
# [right] Right-hand image argument, input VipsImage
# [cmplx] binary complex operation to perform, input VipsOperationComplex2
#
# Output:
# [out] Output image, output VipsImage

##
# :method: complexform
# :call-seq:
#    complexform(right) => out
#
# Form a complex image from two real images.
#
# Input:
# [right] Right-hand image argument, input VipsImage
#
# Output:
# [out] Output image, output VipsImage

##
# :singleton-method: sum
# :call-seq:
#    sum(in) => out
#
# Sum an array of images.
#
# Input:
# [in] Array of input images, input VipsArrayImage
#
# Output:
# [out] Output image, output VipsImage

##
# :method: invert
# :call-seq:
#    invert() => out
#
# Invert an image.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: linear
# :call-seq:
#    linear(a, b) => out
#
# Calculate (a * in + b).
#
# Input:
# [a] Multiply by this, input VipsArrayDouble
# [b] Add this, input VipsArrayDouble
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [uchar] Output should be uchar, input gboolean

##
# :method: math
# :call-seq:
#    math(math) => out
#
# Apply a math operation to an image.
#
# Input:
# [math] math to perform, input VipsOperationMath
#
# Output:
# [out] Output image, output VipsImage

##
# :method: abs
# :call-seq:
#    abs() => out
#
# Absolute value of an image.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: sign
# :call-seq:
#    sign() => out
#
# Unit vector of pixel.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: round
# :call-seq:
#    round(round) => out
#
# Perform a round function on an image.
#
# Input:
# [round] rounding operation to perform, input VipsOperationRound
#
# Output:
# [out] Output image, output VipsImage

##
# :method: relational_const
# :call-seq:
#    relational_const(c, relational) => out
#
# Relational operations against a constant.
#
# Input:
# [c] Array of constants, input VipsArrayDouble
# [relational] relational to perform, input VipsOperationRelational
#
# Output:
# [out] Output image, output VipsImage

##
# :method: remainder_const
# :call-seq:
#    remainder_const(c) => out
#
# Remainder after integer division of an image and a constant.
#
# Input:
# [c] Array of constants, input VipsArrayDouble
#
# Output:
# [out] Output image, output VipsImage

##
# :method: boolean_const
# :call-seq:
#    boolean_const(c, boolean) => out
#
# Boolean operations against a constant.
#
# Input:
# [c] Array of constants, input VipsArrayDouble
# [boolean] boolean to perform, input VipsOperationBoolean
#
# Output:
# [out] Output image, output VipsImage

##
# :method: math2_const
# :call-seq:
#    math2_const(c, math2) => out
#
# Pow( @in, @c ).
#
# Input:
# [c] Array of constants, input VipsArrayDouble
# [math2] math to perform, input VipsOperationMath2
#
# Output:
# [out] Output image, output VipsImage

##
# :method: complex
# :call-seq:
#    complex(cmplx) => out
#
# Perform a complex operation on an image.
#
# Input:
# [cmplx] complex to perform, input VipsOperationComplex
#
# Output:
# [out] Output image, output VipsImage

##
# :method: complexget
# :call-seq:
#    complexget(get) => out
#
# Get a component from a complex image.
#
# Input:
# [get] complex to perform, input VipsOperationComplexget
#
# Output:
# [out] Output image, output VipsImage

##
# :method: avg
# :call-seq:
#    avg() => out
#
# Find image average.
#
# Output:
# [out] Output value, output gdouble

##
# :method: min
# :call-seq:
#    min() => out
#
# Find image minimum.
#
# Output:
# [out] Output value, output gdouble
#
# Options:
# [size] Number of minimum values to find, input gint
#
# Output options:
# [x] Horizontal position of minimum, output gint
# [y] Vertical position of minimum, output gint
# [out_array] Array of output values, output VipsArrayDouble
# [x_array] Array of horizontal positions, output VipsArrayInt
# [y_array] Array of vertical positions, output VipsArrayInt

##
# :method: max
# :call-seq:
#    max() => out
#
# Find image maximum.
#
# Output:
# [out] Output value, output gdouble
#
# Options:
# [size] Number of maximum values to find, input gint
#
# Output options:
# [x] Horizontal position of maximum, output gint
# [y] Vertical position of maximum, output gint
# [out_array] Array of output values, output VipsArrayDouble
# [x_array] Array of horizontal positions, output VipsArrayInt
# [y_array] Array of vertical positions, output VipsArrayInt

##
# :method: deviate
# :call-seq:
#    deviate() => out
#
# Find image standard deviation.
#
# Output:
# [out] Output value, output gdouble

##
# :method: stats
# :call-seq:
#    stats() => out
#
# Find image average.
#
# Output:
# [out] Output array of statistics, output VipsImage

##
# :method: hist_find
# :call-seq:
#    hist_find() => out
#
# Find image histogram.
#
# Output:
# [out] Output histogram, output VipsImage
#
# Options:
# [band] Find histogram of band, input gint

##
# :method: hist_find_ndim
# :call-seq:
#    hist_find_ndim() => out
#
# Find n-dimensional image histogram.
#
# Output:
# [out] Output histogram, output VipsImage
#
# Options:
# [bins] Number of bins in each dimension, input gint

##
# :method: hist_find_indexed
# :call-seq:
#    hist_find_indexed(index) => out
#
# Find indexed image histogram.
#
# Input:
# [index] Index image, input VipsImage
#
# Output:
# [out] Output histogram, output VipsImage

##
# :method: hough_line
# :call-seq:
#    hough_line() => out
#
# Find hough line transform.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [width] horizontal size of parameter space, input gint
# [height] Vertical size of parameter space, input gint

##
# :method: hough_circle
# :call-seq:
#    hough_circle() => out
#
# Find hough circle transform.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [scale] Scale down dimensions by this factor, input gint
# [min_radius] Smallest radius to search for, input gint
# [max_radius] Largest radius to search for, input gint

##
# :method: project
# :call-seq:
#    project() => columns, rows
#
# Find image projections.
#
# Output:
# [columns] Sums of columns, output VipsImage
# [rows] Sums of rows, output VipsImage

##
# :method: profile
# :call-seq:
#    profile() => columns, rows
#
# Find image profiles.
#
# Output:
# [columns] First non-zero pixel in column, output VipsImage
# [rows] First non-zero pixel in row, output VipsImage

##
# :method: measure
# :call-seq:
#    measure(h, v) => out
#
# Measure a set of patches on a colour chart.
#
# Input:
# [h] Number of patches across chart, input gint
# [v] Number of patches down chart, input gint
#
# Output:
# [out] Output array of statistics, output VipsImage
#
# Options:
# [left] Left edge of extract area, input gint
# [top] Top edge of extract area, input gint
# [width] Width of extract area, input gint
# [height] Height of extract area, input gint

##
# :method: getpoint
# :call-seq:
#    getpoint(x, y) => out_array
#
# Read a point from an image.
#
# Input:
# [x] Point to read, input gint
# [y] Point to read, input gint
#
# Output:
# [out_array] Array of output values, output VipsArrayDouble

##
# :method: copy
# :call-seq:
#    copy() => out
#
# Copy an image.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
# [bands] Number of bands in image, input gint
# [format] Pixel format in image, input VipsBandFormat
# [coding] Pixel coding, input VipsCoding
# [interpretation] Pixel interpretation, input VipsInterpretation
# [xres] Horizontal resolution in pixels/mm, input gdouble
# [yres] Vertical resolution in pixels/mm, input gdouble
# [xoffset] Horizontal offset of origin, input gint
# [yoffset] Vertical offset of origin, input gint

##
# :method: tilecache
# :call-seq:
#    tilecache() => out
#
# Cache an image as a set of tiles.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [tile_width] Tile width in pixels, input gint
# [tile_height] Tile height in pixels, input gint
# [max_tiles] Maximum number of tiles to cache, input gint
# [access] Expected access pattern, input VipsAccess
# [threaded] Allow threaded access, input gboolean
# [persistent] Keep cache between evaluations, input gboolean

##
# :method: linecache
# :call-seq:
#    linecache() => out
#
# Cache an image as a set of lines.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [tile_height] Tile height in pixels, input gint
# [access] Expected access pattern, input VipsAccess
# [threaded] Allow threaded access, input gboolean
# [persistent] Keep cache between evaluations, input gboolean

##
# :method: sequential
# :call-seq:
#    sequential() => out
#
# Check sequential access.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [trace] trace pixel requests, input gboolean
# [tile_height] Tile height in pixels, input gint
# [access] Expected access pattern, input VipsAccess

##
# :method: cache
# :call-seq:
#    cache() => out
#
# Cache an image.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [tile_width] Tile width in pixels, input gint
# [tile_height] Tile height in pixels, input gint
# [max_tiles] Maximum number of tiles to cache, input gint

##
# :method: embed
# :call-seq:
#    embed(x, y, width, height) => out
#
# Embed an image in a larger image.
#
# Input:
# [x] Left edge of input in output, input gint
# [y] Top edge of input in output, input gint
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [extend] How to generate the extra pixels, input VipsExtend
# [background] Colour for background pixels, input VipsArrayDouble

##
# :method: flip
# :call-seq:
#    flip(direction) => out
#
# Flip an image.
#
# Input:
# [direction] Direction to flip image, input VipsDirection
#
# Output:
# [out] Output image, output VipsImage

##
# :method: insert
# :call-seq:
#    insert(sub, x, y) => out
#
# Insert image @sub into @main at @x, @y.
#
# Input:
# [sub] Sub-image to insert into main image, input VipsImage
# [x] Left edge of sub in main, input gint
# [y] Top edge of sub in main, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [expand] Expand output to hold all of both inputs, input gboolean
# [background] Colour for new pixels, input VipsArrayDouble

##
# :method: join
# :call-seq:
#    join(in2, direction) => out
#
# Join a pair of images.
#
# Input:
# [in2] Second input image, input VipsImage
# [direction] Join left-right or up-down, input VipsDirection
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [align] Align on the low, centre or high coordinate edge, input VipsAlign
# [expand] Expand output to hold all of both inputs, input gboolean
# [shim] Pixels between images, input gint
# [background] Colour for new pixels, input VipsArrayDouble

##
# :singleton-method: arrayjoin
# :call-seq:
#    arrayjoin(in) => out
#
# Join an array of images.
#
# Input:
# [in] Array of input images, input VipsArrayImage
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [across] Number of images across grid, input gint
# [shim] Pixels between images, input gint
# [background] Colour for new pixels, input VipsArrayDouble
# [halign] Align on the left, centre or right, input VipsAlign
# [valign] Align on the top, centre or bottom, input VipsAlign
# [hspacing] Horizontal spacing between images, input gint
# [vspacing] Vertical spacing between images, input gint

##
# :method: crop
# :call-seq:
#    crop(left, top, width, height) => out
#
# Extract an area from an image.
#
# Input:
# [left] Left edge of extract area, input gint
# [top] Top edge of extract area, input gint
# [width] Width of extract area, input gint
# [height] Height of extract area, input gint
#
# Output:
# [out] Output image, output VipsImage

##
# :method: extract_area
# :call-seq:
#    extract_area(left, top, width, height) => out
#
# Extract an area from an image.
#
# Input:
# [left] Left edge of extract area, input gint
# [top] Top edge of extract area, input gint
# [width] Width of extract area, input gint
# [height] Height of extract area, input gint
#
# Output:
# [out] Output image, output VipsImage

##
# :method: extract_band
# :call-seq:
#    extract_band(band) => out
#
# Extract band from an image.
#
# Input:
# [band] Band to extract, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [n] Number of bands to extract, input gint

##
# :method: bandjoin_const
# :call-seq:
#    bandjoin_const(c) => out
#
# Append a constant band to an image.
#
# Input:
# [c] Array of constants to add, input VipsArrayDouble
#
# Output:
# [out] Output image, output VipsImage

##
# :singleton-method: bandrank
# :call-seq:
#    bandrank(in) => out
#
# Band-wise rank of a set of images.
#
# Input:
# [in] Array of input images, input VipsArrayImage
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [index] Select this band element from sorted list, input gint

##
# :method: bandmean
# :call-seq:
#    bandmean() => out
#
# Band-wise average.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: bandbool
# :call-seq:
#    bandbool(boolean) => out
#
# Boolean operation across image bands.
#
# Input:
# [boolean] boolean to perform, input VipsOperationBoolean
#
# Output:
# [out] Output image, output VipsImage

##
# :method: replicate
# :call-seq:
#    replicate(across, down) => out
#
# Replicate an image.
#
# Input:
# [across] Repeat this many times horizontally, input gint
# [down] Repeat this many times vertically, input gint
#
# Output:
# [out] Output image, output VipsImage

##
# :method: cast
# :call-seq:
#    cast(format) => out
#
# Cast an image.
#
# Input:
# [format] Format to cast to, input VipsBandFormat
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [shift] Shift integer values up and down, input gboolean

##
# :method: rot
# :call-seq:
#    rot(angle) => out
#
# Rotate an image.
#
# Input:
# [angle] Angle to rotate image, input VipsAngle
#
# Output:
# [out] Output image, output VipsImage

##
# :method: rot45
# :call-seq:
#    rot45() => out
#
# Rotate an image.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [angle] Angle to rotate image, input VipsAngle45

##
# :method: autorot
# :call-seq:
#    autorot() => out
#
# Autorotate image by exif tag.
#
# Output:
# [out] Output image, output VipsImage
#
# Output options:
# [angle] Angle image was rotated by, output VipsAngle

##
# :method: recomb
# :call-seq:
#    recomb(m) => out
#
# Linear recombination with matrix.
#
# Input:
# [m] matrix of coefficients, input VipsImage
#
# Output:
# [out] Output image, output VipsImage

##
# :method: bandfold
# :call-seq:
#    bandfold() => out
#
# Fold up x axis into bands.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [factor] Fold by this factor, input gint

##
# :method: bandunfold
# :call-seq:
#    bandunfold() => out
#
# Unfold image bands into x axis.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [factor] Unfold by this factor, input gint

##
# :method: flatten
# :call-seq:
#    flatten() => out
#
# Flatten alpha out of an image.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [background] Background value, input VipsArrayDouble
# [max_alpha] Maximum value of alpha channel, input gdouble

##
# :method: premultiply
# :call-seq:
#    premultiply() => out
#
# Premultiply image alpha.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [max_alpha] Maximum value of alpha channel, input gdouble

##
# :method: unpremultiply
# :call-seq:
#    unpremultiply() => out
#
# Unpremultiply image alpha.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [max_alpha] Maximum value of alpha channel, input gdouble

##
# :method: grid
# :call-seq:
#    grid(tile_height, across, down) => out
#
# Grid an image.
#
# Input:
# [tile_height] chop into tiles this high, input gint
# [across] number of tiles across, input gint
# [down] number of tiles down, input gint
#
# Output:
# [out] Output image, output VipsImage

##
# :method: scale
# :call-seq:
#    scale() => out
#
# Scale an image to uchar.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [log] Log scale, input gboolean
# [exp] Exponent for log scale, input gdouble

##
# :method: wrap
# :call-seq:
#    wrap() => out
#
# Wrap image origin.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [x] Left edge of input in output, input gint
# [y] Top edge of input in output, input gint

##
# :method: zoom
# :call-seq:
#    zoom(xfac, yfac) => out
#
# Zoom an image.
#
# Input:
# [xfac] Horizontal zoom factor, input gint
# [yfac] Vertical zoom factor, input gint
#
# Output:
# [out] Output image, output VipsImage

##
# :method: subsample
# :call-seq:
#    subsample(xfac, yfac) => out
#
# Subsample an image.
#
# Input:
# [xfac] Horizontal subsample factor, input gint
# [yfac] Vertical subsample factor, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [point] Point sample, input gboolean

##
# :method: msb
# :call-seq:
#    msb() => out
#
# Pick most-significant byte from an image.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [band] Band to msb, input gint

##
# :method: byteswap
# :call-seq:
#    byteswap() => out
#
# Byteswap an image.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: falsecolour
# :call-seq:
#    falsecolour() => out
#
# False-colour an image.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: gamma
# :call-seq:
#    gamma() => out
#
# Gamma an image.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [exponent] Gamma factor, input gdouble

##
# :singleton-method: black
# :call-seq:
#    black(width, height) => out
#
# Make a black image.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [bands] Number of bands in image, input gint

##
# :singleton-method: gaussnoise
# :call-seq:
#    gaussnoise(width, height) => out
#
# Make a gaussnoise image.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [mean] Mean of pixels in generated image, input gdouble
# [sigma] Standard deviation of pixels in generated image, input gdouble

##
# :singleton-method: text
# :call-seq:
#    text(text) => out
#
# Make a text image.
#
# Input:
# [text] Text to render, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [font] Font to render width, input gchararray
# [width] Maximum image width in pixels, input gint
# [align] Align on the low, centre or high edge, input VipsAlign
# [dpi] DPI to render at, input gint
# [spacing] Line spacing, input gint

##
# :singleton-method: xyz
# :call-seq:
#    xyz(width, height) => out
#
# Make an image where pixel values are coordinates.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [csize] Size of third dimension, input gint
# [dsize] Size of fourth dimension, input gint
# [esize] Size of fifth dimension, input gint

##
# :singleton-method: gaussmat
# :call-seq:
#    gaussmat(sigma, min_ampl) => out
#
# Make a gaussian image.
#
# Input:
# [sigma] Sigma of Gaussian, input gdouble
# [min_ampl] Minimum amplitude of Gaussian, input gdouble
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [separable] Generate separable Gaussian, input gboolean
# [precision] Generate with this precision, input VipsPrecision

##
# :singleton-method: logmat
# :call-seq:
#    logmat(sigma, min_ampl) => out
#
# Make a laplacian of gaussian image.
#
# Input:
# [sigma] Radius of Logmatian, input gdouble
# [min_ampl] Minimum amplitude of Logmatian, input gdouble
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [separable] Generate separable Logmatian, input gboolean
# [precision] Generate with this precision, input VipsPrecision

##
# :singleton-method: eye
# :call-seq:
#    eye(width, height) => out
#
# Make an image showing the eye's spatial response.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [uchar] Output an unsigned char image, input gboolean
# [factor] Maximum spatial frequency, input gdouble

##
# :singleton-method: grey
# :call-seq:
#    grey(width, height) => out
#
# Make a grey ramp image.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [uchar] Output an unsigned char image, input gboolean

##
# :singleton-method: zone
# :call-seq:
#    zone(width, height) => out
#
# Make a zone plate.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [uchar] Output an unsigned char image, input gboolean

##
# :singleton-method: sines
# :call-seq:
#    sines(width, height) => out
#
# Make a 2d sine wave.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [uchar] Output an unsigned char image, input gboolean
# [hfreq] Horizontal spatial frequency, input gdouble
# [vfreq] Vertical spatial frequency, input gdouble

##
# :singleton-method: mask_ideal
# :call-seq:
#    mask_ideal(width, height, frequency_cutoff) => out
#
# Make an ideal filter.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
# [frequency_cutoff] Frequency cutoff, input gdouble
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [uchar] Output an unsigned char image, input gboolean
# [nodc] Remove DC component, input gboolean
# [reject] Invert the sense of the filter, input gboolean
# [optical] Rotate quadrants to optical space, input gboolean

##
# :singleton-method: mask_ideal_ring
# :call-seq:
#    mask_ideal_ring(width, height, frequency_cutoff, ringwidth) => out
#
# Make an ideal ring filter.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
# [frequency_cutoff] Frequency cutoff, input gdouble
# [ringwidth] Ringwidth, input gdouble
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [uchar] Output an unsigned char image, input gboolean
# [nodc] Remove DC component, input gboolean
# [reject] Invert the sense of the filter, input gboolean
# [optical] Rotate quadrants to optical space, input gboolean

##
# :singleton-method: mask_ideal_band
# :call-seq:
#    mask_ideal_band(width, height, frequency_cutoff_x, frequency_cutoff_y, radius) => out
#
# Make an ideal band filter.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
# [frequency_cutoff_x] Frequency cutoff x, input gdouble
# [frequency_cutoff_y] Frequency cutoff y, input gdouble
# [radius] radius of circle, input gdouble
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [uchar] Output an unsigned char image, input gboolean
# [optical] Rotate quadrants to optical space, input gboolean
# [nodc] Remove DC component, input gboolean
# [reject] Invert the sense of the filter, input gboolean

##
# :singleton-method: mask_butterworth
# :call-seq:
#    mask_butterworth(width, height, order, frequency_cutoff, amplitude_cutoff) => out
#
# Make a butterworth filter.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
# [order] Filter order, input gdouble
# [frequency_cutoff] Frequency cutoff, input gdouble
# [amplitude_cutoff] Amplitude cutoff, input gdouble
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [uchar] Output an unsigned char image, input gboolean
# [optical] Rotate quadrants to optical space, input gboolean
# [nodc] Remove DC component, input gboolean
# [reject] Invert the sense of the filter, input gboolean

##
# :singleton-method: mask_butterworth_ring
# :call-seq:
#    mask_butterworth_ring(width, height, order, frequency_cutoff, amplitude_cutoff, ringwidth) => out
#
# Make a butterworth ring filter.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
# [order] Filter order, input gdouble
# [frequency_cutoff] Frequency cutoff, input gdouble
# [amplitude_cutoff] Amplitude cutoff, input gdouble
# [ringwidth] Ringwidth, input gdouble
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [uchar] Output an unsigned char image, input gboolean
# [optical] Rotate quadrants to optical space, input gboolean
# [nodc] Remove DC component, input gboolean
# [reject] Invert the sense of the filter, input gboolean

##
# :singleton-method: mask_butterworth_band
# :call-seq:
#    mask_butterworth_band(width, height, order, frequency_cutoff_x, frequency_cutoff_y, radius, amplitude_cutoff) => out
#
# Make a butterworth_band filter.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
# [order] Filter order, input gdouble
# [frequency_cutoff_x] Frequency cutoff x, input gdouble
# [frequency_cutoff_y] Frequency cutoff y, input gdouble
# [radius] radius of circle, input gdouble
# [amplitude_cutoff] Amplitude cutoff, input gdouble
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [uchar] Output an unsigned char image, input gboolean
# [optical] Rotate quadrants to optical space, input gboolean
# [reject] Invert the sense of the filter, input gboolean
# [nodc] Remove DC component, input gboolean

##
# :singleton-method: mask_gaussian
# :call-seq:
#    mask_gaussian(width, height, frequency_cutoff, amplitude_cutoff) => out
#
# Make a gaussian filter.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
# [frequency_cutoff] Frequency cutoff, input gdouble
# [amplitude_cutoff] Amplitude cutoff, input gdouble
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [uchar] Output an unsigned char image, input gboolean
# [nodc] Remove DC component, input gboolean
# [reject] Invert the sense of the filter, input gboolean
# [optical] Rotate quadrants to optical space, input gboolean

##
# :singleton-method: mask_gaussian_ring
# :call-seq:
#    mask_gaussian_ring(width, height, frequency_cutoff, amplitude_cutoff, ringwidth) => out
#
# Make a gaussian ring filter.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
# [frequency_cutoff] Frequency cutoff, input gdouble
# [amplitude_cutoff] Amplitude cutoff, input gdouble
# [ringwidth] Ringwidth, input gdouble
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [uchar] Output an unsigned char image, input gboolean
# [optical] Rotate quadrants to optical space, input gboolean
# [nodc] Remove DC component, input gboolean
# [reject] Invert the sense of the filter, input gboolean

##
# :singleton-method: mask_gaussian_band
# :call-seq:
#    mask_gaussian_band(width, height, frequency_cutoff_x, frequency_cutoff_y, radius, amplitude_cutoff) => out
#
# Make a gaussian filter.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
# [frequency_cutoff_x] Frequency cutoff x, input gdouble
# [frequency_cutoff_y] Frequency cutoff y, input gdouble
# [radius] radius of circle, input gdouble
# [amplitude_cutoff] Amplitude cutoff, input gdouble
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [uchar] Output an unsigned char image, input gboolean
# [optical] Rotate quadrants to optical space, input gboolean
# [nodc] Remove DC component, input gboolean
# [reject] Invert the sense of the filter, input gboolean

##
# :singleton-method: mask_fractal
# :call-seq:
#    mask_fractal(width, height, fractal_dimension) => out
#
# Make fractal filter.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
# [fractal_dimension] Fractal dimension, input gdouble
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [uchar] Output an unsigned char image, input gboolean
# [nodc] Remove DC component, input gboolean
# [reject] Invert the sense of the filter, input gboolean
# [optical] Rotate quadrants to optical space, input gboolean

##
# :method: buildlut
# :call-seq:
#    buildlut() => out
#
# Build a look-up table.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: invertlut
# :call-seq:
#    invertlut() => out
#
# Build an inverted look-up table.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [size] LUT size to generate, input gint

##
# :singleton-method: tonelut
# :call-seq:
#    tonelut() => out
#
# Build a look-up table.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [in_max] Size of LUT to build, input gint
# [out_max] Maximum value in output LUT, input gint
# [Lb] Lowest value in output, input gdouble
# [Lw] Highest value in output, input gdouble
# [Ps] Position of shadow, input gdouble
# [Pm] Position of mid-tones, input gdouble
# [Ph] Position of highlights, input gdouble
# [S] Adjust shadows by this much, input gdouble
# [M] Adjust mid-tones by this much, input gdouble
# [H] Adjust highlights by this much, input gdouble

##
# :singleton-method: identity
# :call-seq:
#    identity() => out
#
# Make a 1d image where pixel values are indexes.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [bands] Number of bands in LUT, input gint
# [ushort] Create a 16-bit LUT, input gboolean
# [size] Size of 16-bit LUT, input gint

##
# :singleton-method: fractsurf
# :call-seq:
#    fractsurf(width, height, fractal_dimension) => out
#
# Make a fractal surface.
#
# Input:
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
# [fractal_dimension] Fractal dimension, input gdouble
#
# Output:
# [out] Output image, output VipsImage

##
# :singleton-method: radload
# :call-seq:
#    radload(filename) => out
#
# Load a radiance image from a file.
#
# Input:
# [filename] Filename to load from, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: ppmload
# :call-seq:
#    ppmload(filename) => out
#
# Load ppm from file.
#
# Input:
# [filename] Filename to load from, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: csvload
# :call-seq:
#    csvload(filename) => out
#
# Load csv from file.
#
# Input:
# [filename] Filename to load from, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
# [skip] Skip this many lines at the start of the file, input gint
# [lines] Read this many lines from the file, input gint
# [whitespace] Set of whitespace characters, input gchararray
# [separator] Set of separator characters, input gchararray
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: matrixload
# :call-seq:
#    matrixload(filename) => out
#
# Load matrix from file.
#
# Input:
# [filename] Filename to load from, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: analyzeload
# :call-seq:
#    analyzeload(filename) => out
#
# Load an analyze6 image.
#
# Input:
# [filename] Filename to load from, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: rawload
# :call-seq:
#    rawload(filename, width, height, bands) => out
#
# Load raw data from a file.
#
# Input:
# [filename] Filename to load from, input gchararray
# [width] Image width in pixels, input gint
# [height] Image height in pixels, input gint
# [bands] Number of bands in image, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
# [offset] Offset in bytes from start of file, input guint64
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: vipsload
# :call-seq:
#    vipsload(filename) => out
#
# Load vips from file.
#
# Input:
# [filename] Filename to load from, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: pngload
# :call-seq:
#    pngload(filename) => out
#
# Load png from file.
#
# Input:
# [filename] Filename to load from, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: pngload_buffer
# :call-seq:
#    pngload_buffer(buffer) => out
#
# Load png from buffer.
#
# Input:
# [buffer] Buffer to load from, input VipsBlob
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: matload
# :call-seq:
#    matload(filename) => out
#
# Load mat from file.
#
# Input:
# [filename] Filename to load from, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: jpegload
# :call-seq:
#    jpegload(filename) => out
#
# Load jpeg from file.
#
# Input:
# [filename] Filename to load from, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
# [shrink] Shrink factor on load, input gint
# [fail] Fail on first warning, input gboolean
# [autorotate] Rotate image using exif orientation, input gboolean
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: jpegload_buffer
# :call-seq:
#    jpegload_buffer(buffer) => out
#
# Load jpeg from buffer.
#
# Input:
# [buffer] Buffer to load from, input VipsBlob
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
# [shrink] Shrink factor on load, input gint
# [fail] Fail on first warning, input gboolean
# [autorotate] Rotate image using exif orientation, input gboolean
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: webpload
# :call-seq:
#    webpload(filename) => out
#
# Load webp from file.
#
# Input:
# [filename] Filename to load from, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: webpload_buffer
# :call-seq:
#    webpload_buffer(buffer) => out
#
# Load webp from buffer.
#
# Input:
# [buffer] Buffer to load from, input VipsBlob
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: tiffload
# :call-seq:
#    tiffload(filename) => out
#
# Load tiff from file.
#
# Input:
# [filename] Filename to load from, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
# [page] Load this page from the image, input gint
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: tiffload_buffer
# :call-seq:
#    tiffload_buffer(buffer) => out
#
# Load tiff from buffer.
#
# Input:
# [buffer] Buffer to load from, input VipsBlob
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
# [page] Load this page from the image, input gint
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: openslideload
# :call-seq:
#    openslideload(filename) => out
#
# Load file with openslide.
#
# Input:
# [filename] Filename to load from, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
# [level] Load this level from the file, input gint
# [autocrop] Crop to image bounds, input gboolean
# [associated] Load this associated image, input gchararray
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: magickload
# :call-seq:
#    magickload(filename) => out
#
# Load file with imagemagick.
#
# Input:
# [filename] Filename to load from, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [all_frames] Read all frames from an image, input gboolean
# [density] Canvas resolution for rendering vector formats like SVG, input gchararray
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: magickload_buffer
# :call-seq:
#    magickload_buffer(buffer) => out
#
# Load buffer with imagemagick.
#
# Input:
# [buffer] Buffer to load from, input VipsBlob
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [all_frames] Read all frames from an image, input gboolean
# [density] Canvas resolution for rendering vector formats like SVG, input gchararray
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: fitsload
# :call-seq:
#    fitsload(filename) => out
#
# Load a fits image.
#
# Input:
# [filename] Filename to load from, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :singleton-method: openexrload
# :call-seq:
#    openexrload(filename) => out
#
# Load an openexr image.
#
# Input:
# [filename] Filename to load from, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [disc] Open to disc, input gboolean
# [access] Required access pattern for this file, input VipsAccess
#
# Output options:
# [flags] Flags for this file, output VipsForeignFlags

##
# :method: radsave
# :call-seq:
#    radsave(filename) => 
#
# Save image to radiance file.
#
# Input:
# [filename] Filename to save to, input gchararray
#
# Options:
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: ppmsave
# :call-seq:
#    ppmsave(filename) => 
#
# Save image to ppm file.
#
# Input:
# [filename] Filename to save to, input gchararray
#
# Options:
# [ascii] save as ascii, input gboolean
# [squash] save as one bit, input gboolean
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: csvsave
# :call-seq:
#    csvsave(filename) => 
#
# Save image to csv file.
#
# Input:
# [filename] Filename to save to, input gchararray
#
# Options:
# [separator] Separator characters, input gchararray
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: matrixsave
# :call-seq:
#    matrixsave(filename) => 
#
# Save image to matrix file.
#
# Input:
# [filename] Filename to save to, input gchararray
#
# Options:
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: matrixprint
# :call-seq:
#    matrixprint() => 
#
# Print matrix.
#
# Options:
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: rawsave
# :call-seq:
#    rawsave(filename) => 
#
# Save image to raw file.
#
# Input:
# [filename] Filename to save to, input gchararray
#
# Options:
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: rawsave_fd
# :call-seq:
#    rawsave_fd(fd) => 
#
# Write raw image to file descriptor.
#
# Input:
# [fd] File descriptor to write to, input gint
#
# Options:
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: vipssave
# :call-seq:
#    vipssave(filename) => 
#
# Save image to vips file.
#
# Input:
# [filename] Filename to save to, input gchararray
#
# Options:
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: dzsave
# :call-seq:
#    dzsave(filename) => 
#
# Save image to deep zoom format.
#
# Input:
# [filename] Filename to save to, input gchararray
#
# Options:
# [layout] Directory layout, input VipsForeignDzLayout
# [suffix] Filename suffix for tiles, input gchararray
# [overlap] Tile overlap in pixels, input gint
# [tile_size] Tile size in pixels, input gint
# [centre] Center image in tile, input gboolean
# [depth] Pyramid depth, input VipsForeignDzDepth
# [angle] Rotate image during save, input VipsAngle
# [container] Pyramid container type, input VipsForeignDzContainer
# [properties] Write a properties file to the output directory, input gboolean
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: pngsave
# :call-seq:
#    pngsave(filename) => 
#
# Save image to png file.
#
# Input:
# [filename] Filename to save to, input gchararray
#
# Options:
# [compression] Compression factor, input gint
# [interlace] Interlace image, input gboolean
# [profile] ICC profile to embed, input gchararray
# [filter] libpng row filter flag(s), input VipsForeignPngFilter
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: pngsave_buffer
# :call-seq:
#    pngsave_buffer() => buffer
#
# Save image to png buffer.
#
# Output:
# [buffer] Buffer to save to, output VipsBlob
#
# Options:
# [compression] Compression factor, input gint
# [interlace] Interlace image, input gboolean
# [profile] ICC profile to embed, input gchararray
# [filter] libpng row filter flag(s), input VipsForeignPngFilter
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: jpegsave
# :call-seq:
#    jpegsave(filename) => 
#
# Save image to jpeg file.
#
# Input:
# [filename] Filename to save to, input gchararray
#
# Options:
# [Q] Q factor, input gint
# [profile] ICC profile to embed, input gchararray
# [optimize_coding] Compute optimal Huffman coding tables, input gboolean
# [interlace] Generate an interlaced (progressive) jpeg, input gboolean
# [no_subsample] Disable chroma subsample, input gboolean
# [trellis_quant] Apply trellis quantisation to each 8x8 block, input gboolean
# [overshoot_deringing] Apply overshooting to samples with extreme values, input gboolean
# [optimize_scans] Split the spectrum of DCT coefficients into separate scans, input gboolean
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: jpegsave_buffer
# :call-seq:
#    jpegsave_buffer() => buffer
#
# Save image to jpeg buffer.
#
# Output:
# [buffer] Buffer to save to, output VipsBlob
#
# Options:
# [Q] Q factor, input gint
# [profile] ICC profile to embed, input gchararray
# [optimize_coding] Compute optimal Huffman coding tables, input gboolean
# [interlace] Generate an interlaced (progressive) jpeg, input gboolean
# [no_subsample] Disable chroma subsample, input gboolean
# [trellis_quant] Apply trellis quantisation to each 8x8 block, input gboolean
# [overshoot_deringing] Apply overshooting to samples with extreme values, input gboolean
# [optimize_scans] Split the spectrum of DCT coefficients into separate scans, input gboolean
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: jpegsave_mime
# :call-seq:
#    jpegsave_mime() => 
#
# Save image to jpeg mime.
#
# Options:
# [Q] Q factor, input gint
# [profile] ICC profile to embed, input gchararray
# [optimize_coding] Compute optimal Huffman coding tables, input gboolean
# [interlace] Generate an interlaced (progressive) jpeg, input gboolean
# [no_subsample] Disable chroma subsample, input gboolean
# [trellis_quant] Apply trellis quantisation to each 8x8 block, input gboolean
# [overshoot_deringing] Apply overshooting to samples with extreme values, input gboolean
# [optimize_scans] Split the spectrum of DCT coefficients into separate scans, input gboolean
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: webpsave
# :call-seq:
#    webpsave(filename) => 
#
# Save image to webp file.
#
# Input:
# [filename] Filename to save to, input gchararray
#
# Options:
# [Q] Q factor, input gint
# [lossless] enable lossless compression, input gboolean
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: webpsave_buffer
# :call-seq:
#    webpsave_buffer() => buffer
#
# Save image to webp buffer.
#
# Output:
# [buffer] Buffer to save to, output VipsBlob
#
# Options:
# [Q] Q factor, input gint
# [lossless] enable lossless compression, input gboolean
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: tiffsave
# :call-seq:
#    tiffsave(filename) => 
#
# Save image to tiff file.
#
# Input:
# [filename] Filename to save to, input gchararray
#
# Options:
# [compression] Compression for this file, input VipsForeignTiffCompression
# [Q] Q factor, input gint
# [predictor] Compression prediction, input VipsForeignTiffPredictor
# [profile] ICC profile to embed, input gchararray
# [tile] Write a tiled tiff, input gboolean
# [tile_width] Tile width in pixels, input gint
# [tile_height] Tile height in pixels, input gint
# [pyramid] Write a pyramidal tiff, input gboolean
# [miniswhite] Use 0 for white in 1-bit images, input gboolean
# [squash] Squash images down to 1 bit, input gboolean
# [resunit] Resolution unit, input VipsForeignTiffResunit
# [xres] Horizontal resolution in pixels/mm, input gdouble
# [yres] Vertical resolution in pixels/mm, input gdouble
# [bigtiff] Write a bigtiff image, input gboolean
# [properties] Write a properties document to IMAGEDESCRIPTION, input gboolean
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: fitssave
# :call-seq:
#    fitssave(filename) => 
#
# Save image to fits file.
#
# Input:
# [filename] Filename to save to, input gchararray
#
# Options:
# [strip] Strip all metadata from image, input gboolean
# [background] Background value, input VipsArrayDouble

##
# :method: mapim
# :call-seq:
#    mapim(index) => out
#
# Resample with an mapim image.
#
# Input:
# [index] Index pixels with this, input VipsImage
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [interpolate] Interpolate pixels with this, input VipsInterpolate

##
# :method: shrink
# :call-seq:
#    shrink(xshrink, yshrink) => out
#
# Shrink an image.
#
# Input:
# [xshrink] Horizontal shrink factor, input gdouble
# [yshrink] Vertical shrink factor, input gdouble
#
# Output:
# [out] Output image, output VipsImage

##
# :method: shrinkh
# :call-seq:
#    shrinkh(xshrink) => out
#
# Shrink an image horizontally.
#
# Input:
# [xshrink] Horizontal shrink factor, input gint
#
# Output:
# [out] Output image, output VipsImage

##
# :method: shrinkv
# :call-seq:
#    shrinkv(yshrink) => out
#
# Shrink an image vertically.
#
# Input:
# [yshrink] Vertical shrink factor, input gint
#
# Output:
# [out] Output image, output VipsImage

##
# :method: shrink2
# :call-seq:
#    shrink2(xshrink, yshrink) => out
#
# Shrink an image.
#
# Input:
# [xshrink] Horizontal shrink factor, input gdouble
# [yshrink] Vertical shrink factor, input gdouble
#
# Output:
# [out] Output image, output VipsImage

##
# :method: quadratic
# :call-seq:
#    quadratic(coeff) => out
#
# Resample an image with a quadratic transform.
#
# Input:
# [coeff] Coefficient matrix, input VipsImage
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [interpolate] Interpolate values with this, input VipsInterpolate

##
# :method: affine
# :call-seq:
#    affine(matrix) => out
#
# Affine transform of an image.
#
# Input:
# [matrix] Transformation matrix, input VipsArrayDouble
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [interpolate] Interpolate pixels with this, input VipsInterpolate
# [oarea] Area of output to generate, input VipsArrayInt
# [odx] Horizontal output displacement, input gdouble
# [ody] Vertical output displacement, input gdouble
# [idx] Horizontal input displacement, input gdouble
# [idy] Vertical input displacement, input gdouble

##
# :method: similarity
# :call-seq:
#    similarity() => out
#
# Similarity transform of an image.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [interpolate] Interpolate pixels with this, input VipsInterpolate
# [scale] Scale by this factor, input gdouble
# [angle] Rotate anticlockwise by this many degrees, input gdouble
# [odx] Horizontal output displacement, input gdouble
# [ody] Vertical output displacement, input gdouble
# [idx] Horizontal input displacement, input gdouble
# [idy] Vertical input displacement, input gdouble

##
# :method: resize
# :call-seq:
#    resize(scale) => out
#
# Resize an image.
#
# Input:
# [scale] Scale image by this factor, input gdouble
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [interpolate] Interpolate pixels with this, input VipsInterpolate
# [vscale] Vertical scale image by this factor, input gdouble
# [idx] Horizontal input displacement, input gdouble
# [idy] Vertical input displacement, input gdouble

##
# :method: colourspace
# :call-seq:
#    colourspace(space) => out
#
# Convert to a new colourspace.
#
# Input:
# [space] Destination colour space, input VipsInterpretation
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [source_space] Source colour space, input VipsInterpretation

##
# :method: Lab2XYZ
# :call-seq:
#    Lab2XYZ() => out
#
# Transform cielab to xyz.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [temp] Colour temperature, input VipsArrayDouble

##
# :method: XYZ2Lab
# :call-seq:
#    XYZ2Lab() => out
#
# Transform xyz to lab.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [temp] Colour temperature, input VipsArrayDouble

##
# :method: Lab2LCh
# :call-seq:
#    Lab2LCh() => out
#
# Transform lab to lch.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: LCh2Lab
# :call-seq:
#    LCh2Lab() => out
#
# Transform lch to lab.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: LCh2CMC
# :call-seq:
#    LCh2CMC() => out
#
# Transform lch to cmc.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: CMC2LCh
# :call-seq:
#    CMC2LCh() => out
#
# Transform lch to cmc.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: XYZ2Yxy
# :call-seq:
#    XYZ2Yxy() => out
#
# Transform xyz to yxy.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: Yxy2XYZ
# :call-seq:
#    Yxy2XYZ() => out
#
# Transform yxy to xyz.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: scRGB2XYZ
# :call-seq:
#    scRGB2XYZ() => out
#
# Transform scrgb to xyz.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: XYZ2scRGB
# :call-seq:
#    XYZ2scRGB() => out
#
# Transform xyz to scrgb.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: LabQ2Lab
# :call-seq:
#    LabQ2Lab() => out
#
# Unpack a labq image to float lab.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: Lab2LabQ
# :call-seq:
#    Lab2LabQ() => out
#
# Transform float lab to labq coding.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: LabQ2LabS
# :call-seq:
#    LabQ2LabS() => out
#
# Unpack a labq image to short lab.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: LabS2LabQ
# :call-seq:
#    LabS2LabQ() => out
#
# Transform short lab to labq coding.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: LabS2Lab
# :call-seq:
#    LabS2Lab() => out
#
# Transform signed short lab to float.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: Lab2LabS
# :call-seq:
#    Lab2LabS() => out
#
# Transform float lab to signed short.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: rad2float
# :call-seq:
#    rad2float() => out
#
# Unpack radiance coding to float rgb.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: float2rad
# :call-seq:
#    float2rad() => out
#
# Transform float rgb to radiance coding.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: LabQ2sRGB
# :call-seq:
#    LabQ2sRGB() => out
#
# Convert a labq image to srgb.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: sRGB2HSV
# :call-seq:
#    sRGB2HSV() => out
#
# Transform srgb to hsv.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: HSV2sRGB
# :call-seq:
#    HSV2sRGB() => out
#
# Transform hsv to srgb.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: icc_import
# :call-seq:
#    icc_import() => out
#
# Import from device with icc profile.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [pcs] Set Profile Connection Space, input VipsPCS
# [intent] Rendering intent, input VipsIntent
# [embedded] Use embedded input profile, if available, input gboolean
# [input_profile] Filename to load input profile from, input gchararray

##
# :method: icc_export
# :call-seq:
#    icc_export() => out
#
# Output to device with icc profile.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [pcs] Set Profile Connection Space, input VipsPCS
# [intent] Rendering intent, input VipsIntent
# [output_profile] Filename to load output profile from, input gchararray
# [depth] Output device space depth in bits, input gint

##
# :method: icc_transform
# :call-seq:
#    icc_transform(output_profile) => out
#
# Transform between devices with icc profiles.
#
# Input:
# [output_profile] Filename to load output profile from, input gchararray
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [pcs] Set Profile Connection Space, input VipsPCS
# [intent] Rendering intent, input VipsIntent
# [embedded] Use embedded input profile, if available, input gboolean
# [input_profile] Filename to load input profile from, input gchararray
# [depth] Output device space depth in bits, input gint

##
# :method: dE76
# :call-seq:
#    dE76(right) => out
#
# Calculate de76.
#
# Input:
# [right] Right-hand input image, input VipsImage
#
# Output:
# [out] Output image, output VipsImage

##
# :method: dE00
# :call-seq:
#    dE00(right) => out
#
# Calculate de00.
#
# Input:
# [right] Right-hand input image, input VipsImage
#
# Output:
# [out] Output image, output VipsImage

##
# :method: dECMC
# :call-seq:
#    dECMC(right) => out
#
# Calculate decmc.
#
# Input:
# [right] Right-hand input image, input VipsImage
#
# Output:
# [out] Output image, output VipsImage

##
# :method: sRGB2scRGB
# :call-seq:
#    sRGB2scRGB() => out
#
# Convert an srgb image to scrgb.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: scRGB2BW
# :call-seq:
#    scRGB2BW() => out
#
# Convert scrgb to bw.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [depth] Output device space depth in bits, input gint

##
# :method: scRGB2sRGB
# :call-seq:
#    scRGB2sRGB() => out
#
# Convert an scrgb image to srgb.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [depth] Output device space depth in bits, input gint

##
# :method: maplut
# :call-seq:
#    maplut(lut) => out
#
# Map an image though a lut.
#
# Input:
# [lut] Look-up table image, input VipsImage
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [band] apply one-band lut to this band of in, input gint

##
# :method: percent
# :call-seq:
#    percent(percent) => threshold
#
# Find threshold for percent of pixels.
#
# Input:
# [percent] Percent of pixels, input gdouble
#
# Output:
# [threshold] Threshold above which lie percent of pixels, output gint

##
# :method: stdif
# :call-seq:
#    stdif(width, height) => out
#
# Statistical difference.
#
# Input:
# [width] Window width in pixels, input gint
# [height] Window height in pixels, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [a] Weight of new mean, input gdouble
# [s0] New deviation, input gdouble
# [b] Weight of new deviation, input gdouble
# [m0] New mean, input gdouble

##
# :method: hist_cum
# :call-seq:
#    hist_cum() => out
#
# Form cumulative histogram.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: hist_match
# :call-seq:
#    hist_match(ref) => out
#
# Match two histograms.
#
# Input:
# [ref] Reference histogram, input VipsImage
#
# Output:
# [out] Output image, output VipsImage

##
# :method: hist_norm
# :call-seq:
#    hist_norm() => out
#
# Normalise histogram.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: hist_equal
# :call-seq:
#    hist_equal() => out
#
# Histogram equalisation.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [band] Equalise with this band, input gint

##
# :method: hist_plot
# :call-seq:
#    hist_plot() => out
#
# Plot histogram.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: hist_local
# :call-seq:
#    hist_local(width, height) => out
#
# Local histogram equalisation.
#
# Input:
# [width] Window width in pixels, input gint
# [height] Window height in pixels, input gint
#
# Output:
# [out] Output image, output VipsImage

##
# :method: hist_ismonotonic
# :call-seq:
#    hist_ismonotonic() => monotonic
#
# Test for monotonicity.
#
# Output:
# [monotonic] true if in is monotonic, output gboolean

##
# :method: hist_entropy
# :call-seq:
#    hist_entropy() => out
#
# Estimate image entropy.
#
# Output:
# [out] Output value, output gdouble

##
# :method: conv
# :call-seq:
#    conv(mask) => out
#
# Convolution operation.
#
# Input:
# [mask] Input matrix image, input VipsImage
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [precision] Convolve with this precision, input VipsPrecision
# [layers] Use this many layers in approximation, input gint
# [cluster] Cluster lines closer than this in approximation, input gint

##
# :method: compass
# :call-seq:
#    compass(mask) => out
#
# Convolve with rotating mask.
#
# Input:
# [mask] Input matrix image, input VipsImage
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [times] Rotate and convolve this many times, input gint
# [angle] Rotate mask by this much between convolutions, input VipsAngle45
# [combine] Combine convolution results like this, input VipsCombine
# [precision] Convolve with this precision, input VipsPrecision
# [layers] Use this many layers in approximation, input gint
# [cluster] Cluster lines closer than this in approximation, input gint

##
# :method: convsep
# :call-seq:
#    convsep(mask) => out
#
# Seperable convolution operation.
#
# Input:
# [mask] Input matrix image, input VipsImage
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [precision] Convolve with this precision, input VipsPrecision
# [layers] Use this many layers in approximation, input gint
# [cluster] Cluster lines closer than this in approximation, input gint

##
# :method: fastcor
# :call-seq:
#    fastcor(ref) => out
#
# Fast correlation.
#
# Input:
# [ref] Input reference image, input VipsImage
#
# Output:
# [out] Output image, output VipsImage

##
# :method: spcor
# :call-seq:
#    spcor(ref) => out
#
# Spatial correlation.
#
# Input:
# [ref] Input reference image, input VipsImage
#
# Output:
# [out] Output image, output VipsImage

##
# :method: sharpen
# :call-seq:
#    sharpen() => out
#
# Unsharp masking for print.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [radius] Mask radius, input gint
# [x1] Flat/jaggy threshold, input gdouble
# [y2] Maximum brightening, input gdouble
# [y3] Maximum darkening, input gdouble
# [m1] Slope for flat areas, input gdouble
# [m2] Slope for jaggy areas, input gdouble

##
# :method: gaussblur
# :call-seq:
#    gaussblur(sigma) => out
#
# Gaussian blur.
#
# Input:
# [sigma] Sigma of Gaussian, input gdouble
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [min_ampl] Minimum amplitude of Gaussian, input gdouble
# [precision] Convolve with this precision, input VipsPrecision

##
# :method: fwfft
# :call-seq:
#    fwfft() => out
#
# Forward fft.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: invfft
# :call-seq:
#    invfft() => out
#
# Inverse fft.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [real] Output only the real part of the transform, input gboolean

##
# :method: freqmult
# :call-seq:
#    freqmult(mask) => out
#
# Frequency-domain filtering.
#
# Input:
# [mask] Input mask image, input VipsImage
#
# Output:
# [out] Output image, output VipsImage

##
# :method: spectrum
# :call-seq:
#    spectrum() => out
#
# Make displayable power spectrum.
#
# Output:
# [out] Output image, output VipsImage

##
# :method: phasecor
# :call-seq:
#    phasecor(in2) => out
#
# Calculate phase correlation.
#
# Input:
# [in2] Second input image, input VipsImage
#
# Output:
# [out] Output image, output VipsImage

##
# :method: morph
# :call-seq:
#    morph(mask, morph) => out
#
# Morphology operation.
#
# Input:
# [mask] Input matrix image, input VipsImage
# [morph] Morphological operation to perform, input VipsOperationMorphology
#
# Output:
# [out] Output image, output VipsImage

##
# :method: rank
# :call-seq:
#    rank(width, height, index) => out
#
# Rank filter.
#
# Input:
# [width] Window width in pixels, input gint
# [height] Window height in pixels, input gint
# [index] Select pixel at index, input gint
#
# Output:
# [out] Output image, output VipsImage

##
# :method: countlines
# :call-seq:
#    countlines(direction) => nolines
#
# Count lines in an image.
#
# Input:
# [direction] Countlines left-right or up-down, input VipsDirection
#
# Output:
# [nolines] Number of lines, output gdouble

##
# :method: labelregions
# :call-seq:
#    labelregions() => mask
#
# Label regions in an image.
#
# Output:
# [mask] Mask of region labels, output VipsImage
#
# Output options:
# [segments] Number of discrete contigious regions, output gint

##
# :method: draw_rect
# :call-seq:
#    draw_rect(ink, left, top, width, height) => image
#
# Paint a rectangle on an image.
#
# Input:
# [ink] Colour for pixels, input VipsArrayDouble
# [left] Rect to fill, input gint
# [top] Rect to fill, input gint
# [width] Rect to fill, input gint
# [height] Rect to fill, input gint
#
# Output:
# [image] Image to draw on, input VipsImage
#
# Options:
# [fill] Draw a solid object, input gboolean

##
# :method: draw_mask
# :call-seq:
#    draw_mask(ink, mask, x, y) => image
#
# Draw a mask on an image.
#
# Input:
# [ink] Colour for pixels, input VipsArrayDouble
# [mask] Mask of pixels to draw, input VipsImage
# [x] Draw mask here, input gint
# [y] Draw mask here, input gint
#
# Output:
# [image] Image to draw on, input VipsImage

##
# :method: draw_line
# :call-seq:
#    draw_line(ink, x1, y1, x2, y2) => image
#
# Draw a line on an image.
#
# Input:
# [ink] Colour for pixels, input VipsArrayDouble
# [x1] Start of draw_line, input gint
# [y1] Start of draw_line, input gint
# [x2] End of draw_line, input gint
# [y2] End of draw_line, input gint
#
# Output:
# [image] Image to draw on, input VipsImage

##
# :method: draw_circle
# :call-seq:
#    draw_circle(ink, cx, cy, radius) => image
#
# Draw a circle on an image.
#
# Input:
# [ink] Colour for pixels, input VipsArrayDouble
# [cx] Centre of draw_circle, input gint
# [cy] Centre of draw_circle, input gint
# [radius] Radius in pixels, input gint
#
# Output:
# [image] Image to draw on, input VipsImage
#
# Options:
# [fill] Draw a solid object, input gboolean

##
# :method: draw_flood
# :call-seq:
#    draw_flood(ink, x, y) => image
#
# Flood-fill an area.
#
# Input:
# [ink] Colour for pixels, input VipsArrayDouble
# [x] DrawFlood start point, input gint
# [y] DrawFlood start point, input gint
#
# Output:
# [image] Image to draw on, input VipsImage
#
# Options:
# [test] Test pixels in this image, input VipsImage
# [equal] DrawFlood while equal to edge, input gboolean
#
# Output options:
# [left] Left edge of modified area, output gint
# [top] top edge of modified area, output gint
# [width] width of modified area, output gint
# [height] height of modified area, output gint

##
# :method: draw_image
# :call-seq:
#    draw_image(sub, x, y) => image
#
# Paint an image into another image.
#
# Input:
# [sub] Sub-image to insert into main image, input VipsImage
# [x] Draw image here, input gint
# [y] Draw image here, input gint
#
# Output:
# [image] Image to draw on, input VipsImage
#
# Options:
# [mode] Combining mode, input VipsCombineMode

##
# :method: draw_smudge
# :call-seq:
#    draw_smudge(left, top, width, height) => image
#
# Blur a rectangle on an image.
#
# Input:
# [left] Rect to fill, input gint
# [top] Rect to fill, input gint
# [width] Rect to fill, input gint
# [height] Rect to fill, input gint
#
# Output:
# [image] Image to draw on, input VipsImage

##
# :method: merge
# :call-seq:
#    merge(sec, direction, dx, dy) => out
#
# Merge two images.
#
# Input:
# [sec] Secondary image, input VipsImage
# [direction] Horizontal or vertcial merge, input VipsDirection
# [dx] Horizontal displacement from sec to ref, input gint
# [dy] Vertical displacement from sec to ref, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [mblend] Maximum blend size, input gint

##
# :method: mosaic
# :call-seq:
#    mosaic(sec, direction, xref, yref, xsec, ysec) => out
#
# Mosaic two images.
#
# Input:
# [sec] Secondary image, input VipsImage
# [direction] Horizontal or vertcial mosaic, input VipsDirection
# [xref] Position of reference tie-point, input gint
# [yref] Position of reference tie-point, input gint
# [xsec] Position of secondary tie-point, input gint
# [ysec] Position of secondary tie-point, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [hwindow] Half window size, input gint
# [harea] Half area size, input gint
# [mblend] Maximum blend size, input gint
# [bandno] Band to search for features on, input gint
#
# Output options:
# [dx0] Detected integer offset, output gint
# [dy0] Detected integer offset, output gint
# [scale1] Detected scale, output gdouble
# [angle1] Detected rotation, output gdouble
# [dx1] Detected first-order displacement, output gdouble
# [dy1] Detected first-order displacement, output gdouble

##
# :method: mosaic1
# :call-seq:
#    mosaic1(sec, direction, xr1, yr1, xs1, ys1, xr2, yr2, xs2, ys2) => out
#
# First-order mosaic of two images.
#
# Input:
# [sec] Secondary image, input VipsImage
# [direction] Horizontal or vertcial mosaic, input VipsDirection
# [xr1] Position of first reference tie-point, input gint
# [yr1] Position of first reference tie-point, input gint
# [xs1] Position of first secondary tie-point, input gint
# [ys1] Position of first secondary tie-point, input gint
# [xr2] Position of second reference tie-point, input gint
# [yr2] Position of second reference tie-point, input gint
# [xs2] Position of second secondary tie-point, input gint
# [ys2] Position of second secondary tie-point, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [hwindow] Half window size, input gint
# [harea] Half area size, input gint
# [search] Search to improve tie-points, input gboolean
# [interpolate] Interpolate pixels with this, input VipsInterpolate
# [mblend] Maximum blend size, input gint
# [bandno] Band to search for features on, input gint

##
# :method: match
# :call-seq:
#    match(sec, xr1, yr1, xs1, ys1, xr2, yr2, xs2, ys2) => out
#
# First-order match of two images.
#
# Input:
# [sec] Secondary image, input VipsImage
# [xr1] Position of first reference tie-point, input gint
# [yr1] Position of first reference tie-point, input gint
# [xs1] Position of first secondary tie-point, input gint
# [ys1] Position of first secondary tie-point, input gint
# [xr2] Position of second reference tie-point, input gint
# [yr2] Position of second reference tie-point, input gint
# [xs2] Position of second secondary tie-point, input gint
# [ys2] Position of second secondary tie-point, input gint
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [hwindow] Half window size, input gint
# [harea] Half area size, input gint
# [search] Search to improve tie-points, input gboolean
# [interpolate] Interpolate pixels with this, input VipsInterpolate

##
# :method: globalbalance
# :call-seq:
#    globalbalance() => out
#
# Global balance an image mosaic.
#
# Output:
# [out] Output image, output VipsImage
#
# Options:
# [gamma] Image gamma, input gdouble
# [int_output] Integer output, input gboolean

  end
end
