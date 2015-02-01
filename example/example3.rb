#!/usr/bin/ruby

require 'vips8'

puts ""
puts "starting up:"
# this makes vips keep a list of all active objects whcih we can print out
Vips::leak_set true
Vips::cache_set_max 0

im = Vips::Image.new_from_file "/home/john/pics/k2.jpg", :access => :sequential

im = im.embed 100, 100, 3000, 3000, :extend => :mirror

im.write_to_file "x.v"

puts ""
puts "shutting down:"
GC.start
