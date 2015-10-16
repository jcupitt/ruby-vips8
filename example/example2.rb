#!/usr/bin/ruby

require 'vips8'

puts ""
puts "starting up:"

# disable the operation cache
Vips::cache_set_max 0

n = 100

n.times do |i|
    puts ""
    puts "call #{i} ..."
    out = Vips::call "black", 200, 300
    if out.width != 200 or out.height != 300
        puts "bad image result from black"
    end
end

puts ""
puts "after #{n} calls:"
GC.start
Vips::Object::print_all

puts ""
puts "freeing:"
out = nil
GC.start
Vips::Object::print_all

puts ""
puts "shutting down:"
GC.start
