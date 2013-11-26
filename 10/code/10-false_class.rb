#!/usr/bin/env ruby

puts "instance_methods(false)"
puts FalseClass.instance_methods(false).to_s

puts "instance_methods"
puts FalseClass.instance_methods.to_s

puts "String instace methods == foo methods?"
puts String.instance_methods == "foo".methods

puts "String methods == foo methods?"
puts String.methods == "foo".methods

puts "String methods:"
puts String.methods.to_s

