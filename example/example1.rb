#!/usr/bin/ruby

require 'vips8'

puts ""
puts "starting up:"
# this makes vips keep a list of all active objects whcih we can print out
Vips::leak_set true

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

x = Vips::Image.new_from_file "/home/john/pics/k2.jpg"

puts ""
puts "shutting down:"
GC.start
Vips::shutdown
GC.start
