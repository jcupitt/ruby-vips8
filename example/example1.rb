#!/usr/bin/ruby

require 'vips8'
$vips_debug = true

puts ""
puts "starting up:"

# this makes vips keep a list of all active objects which we can print out
Vips::leak_set true

# disable the operation cache
Vips::cache_set_max 0

puts ""
puts "creating object:"
x = Vips::Image.new
Vips::Object::print_all

puts ""
puts "freeing object:"
x = nil
GC.start
Vips::Object::print_all

puts ""
puts "shutting down:"
GC.start
Vips::shutdown
GC.start
