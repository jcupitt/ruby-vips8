#!/usr/bin/ruby

# An equivalent of ImageMagick's -trim in ruby-vips8 ... automatically remove
# "boring" image edges.

# We use .project to sum the rows and columns of a 0/255 mask image, the first
# non-zero row or column is the object edge. We make the mask image with an
# amount-different-from-background image plus a threshold.

require 'vips8'

im = Vips::Image.new_from_file ARGV[0]

class Vips::Image
    # a median filter
    def median(size = 3)
        rank(size, size, (size * size) / 2)
    end

    # get the value of a pixel as an array
    def getpoint(x, y)
        crop(x, y, 1, 1).bandsplit.map {|i| i.avg}
    end
end

# find the value of the pixel at (0, 0) ... we will search for all pixels 
# significantly different from this
background = im.getpoint(0, 0)

# we need to smooth the image, subtract the background from every pixel, take 
# the absolute value of the difference, then threshold
mask = (im.median - background).abs > 10

# sum mask rows and columns, then search for the first non-zero sum in each
# direction
columns, rows = mask.project

first_column, first_row = columns.profile
left = first_row.min

first_column, first_row = columns.flip(:horizontal).profile
right = columns.width - first_row.min

first_column, first_row = rows.profile
top = first_column.min

first_column, first_row = rows.flip(:vertical).profile
bottom = rows.height - first_column.min

# and now crop the original image
im = im.crop left, top, right - left, bottom - top

im.write_to_file ARGV[1]
