#!/usr/bin/ruby

require 'vips8'

puts ""
puts "starting up:"
# this makes vips keep a list of all active objects 
Vips::leak_set true

# disable the operation cache
Vips::cache_set_max 0

# turn on debug logging
#Vips.set_debug true

ARGV.each do |filename|
    im = Vips::Image.new_from_file filename, :access => :sequential
    im = im.embed 100, 100, 3000, 3000, :extend => :mirror
    im.write_to_file "x.v"
end

puts ""
puts "shutting down:"
im = nil
GC.start
