#!/usr/bin/ruby

puts "testing libvips with plain gir_ffi ... no vips8 wrapper"

require 'gir_ffi'

GirFFI.setup :Vips

Vips::init($PROGRAM_NAME)

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
op = Vips::Operation.new "jpegload"
op.set_property "filename", "/data/john/pics/k2.jpg"
op2 = Vips::cache_operation_lookup op
if op2
    puts "cache hit .. dropping old op"
    op = op2
else
    puts "cache miss .. building"
    op.build
end
GC.start
Vips::Object::print_all

puts ""
puts "unreffing outputs:"
op.unref_outputs
GC.start
Vips::Object::print_all

puts ""
puts "freeing operation:"
op = nil
GC.start
Vips::Object::print_all

puts ""
puts "creating operation:"
op = Vips::Operation.new "jpegload"
op.set_property "filename", "/data/john/pics/k4.jpg"
op2 = Vips::cache_operation_lookup op
if op2
    puts "cache hit .. dropping old op"
    op = op2
else
    puts "cache miss .. building"
    op.build
end
GC.start
Vips::Object::print_all

puts ""
puts "fetching output:"
out = op.property("out")
Vips::Object::print_all

puts ""
puts "freeing operation:" 
op.unref_outputs
op = nil
GC.start
Vips::Object::print_all

puts ""
puts "freeing output:"
out = nil
GC.start
Vips::Object::print_all

puts ""
puts "shutting down:"
GC.start
Vips::shutdown
GC.start
