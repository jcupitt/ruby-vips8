#!/usr/bin/ruby

require 'vips8'

# this makes vips keep a list of all active objects 
# Vips::leak_set true

# disable the operation cache
# Vips::cache_set_max 0

# turn on debug logging
#Vips.set_debug true

10000.times do |i|
    puts "loop #{i} ..."
    filename = "/data/john/pics/k2.jpg"
    im = Vips::Image.new_from_file filename
    im = im.embed 100, 100, 3000, 3000, :extend => :mirror
    im.write_to_file "x.v"
end
