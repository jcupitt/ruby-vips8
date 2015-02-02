#!/usr/bin/ruby

require 'vips8'

puts ""
puts "starting up:"
# this makes vips keep a list of all active objects 
Vips::leak_set true

# disable the operation cache
Vips::cache_set_max 0


$debug = true

100.times do |i|
    puts "loop #{i} ..."
    im = Vips::Image.new_from_file "/data/john/pics/k2.jpg", :access => :sequential

    im = im.embed 100, 100, 3000, 3000, :extend => :mirror

    im.write_to_file "x.v"
end

puts ""
puts "shutting down:"
im = nil
GC.start
