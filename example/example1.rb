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

puts ""
puts "creating operation:"
x = Vips::Operation.new "black"

gobject_class = x.gtype.to_class

props = gobject_class.properties

puts "seen props: #{props}"

args = props.select do |name|
    flags = x.get_argument_flags name
    io = ((flags & :input) | (flags & :output)) != 0
    dep = (flags & :deprecated) != 0
    io & (not dep)
end

args.each do |name|
    flags = x.get_argument_flags name
    puts "#{name} - #{flags.inspect}"
end

class Argument # :nodoc:
    attr_reader :op, :prop, :name, :flags, :priority, :isset

    def initialize(op, name)
        gobject_class = op.gtype.to_class
        @op = op 
        @name = name.tr '-', '_'
        @prop = gobject_class.property name
        @flags = op.get_argument_flags name
        @priority = op.get_argument_priority @name
        @isset = op.argument_isset @name
    end
end

props = args.map {|name| Argument.new x, name}

props.each do |prop|
    puts "#{prop.name} - #{prop.inspect}"
end

x.unref_outputs
x = nil

puts ""
puts "shutting down:"
GC.start
Vips::shutdown
GC.start
