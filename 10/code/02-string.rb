#!/usr/bin/env ruby

cat = "cat"
begin
  puts cat.encrypt
rescue Exception => e
  puts e.message
end

class String
  def encrypt
    tr "a-z", "b-za"
  end
end

puts cat.encrypt
puts "dog".encrypt