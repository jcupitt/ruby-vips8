#!/usr/bin/ruby

require 'vips8'

puts ""
puts "starting up:"
# this makes vips keep a list of all active objects whcih we can print out
Vips::leak_set true

im = Vips::call "black", 200, 200


im = nil

puts ""
puts "shutting down:"
GC.start
Vips::shutdown
GC.start
