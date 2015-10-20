#!/usr/bin/ruby

require 'vips8'

# this makes vips keep a list of all active objects 
#Vips::leak_set true

# disable the operation cache
#Vips::cache_set_max 0

# any image is fine
filename = "/home/john/pics/k2.jpg"

100.times do |i|
    puts "loop #{i} ..."
    im = Vips::Image.new_from_file filename
    im = im.embed 100, 100, 3000, 3000, :extend => :mirror
    im.write_to_file "x.v"
end

