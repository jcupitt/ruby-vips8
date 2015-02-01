#!/usr/bin/ruby

require 'vips8'

puts ""
puts "starting up:"
# this makes vips keep a list of all active objects whcih we can print out
Vips::leak_set true

100.times do |i|
    puts ""
    puts "call #{i} ..."
    Vips::call "black", 200, 200
    #GC.start
    Vips::Object::print_all
end

puts ""
puts "after 100 calls:"
GC.start
Vips::Object::print_all

puts ""
puts "shutting down:"
GC.start
