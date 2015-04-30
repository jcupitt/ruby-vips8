#!/usr/bin/ruby

require 'vips8'

puts ""
puts "starting up:"

# this makes vips keep a list of all active objects which we can print out
Vips::leak_set true

# disable the operation cache
#Vips::cache_set_max 0

puts ""
puts "creating object:"
x = Vips::Image.new
x.print_dump
Vips::Object::print_all

puts ""
puts "freeing object:"
x = nil
GC.start
Vips::Object::print_all

puts ""
puts "creating operation:"
op = Vips::Operation.new "black"
op.set_property "width", 100
op.set_property "height", 100
op = Vips::cache_operation_build op
GC.start
Vips::Object::print_all

puts ""
puts "freeing operation:"
op.unref_outputs
op = nil
GC.start
Vips::Object::print_all

puts ""
puts "shutting down:"
GC.start
Vips::shutdown
GC.start
