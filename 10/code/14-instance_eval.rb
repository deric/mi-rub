#!/usr/bin/env ruby

animal = "duck"
animal.instance_eval do
  def speak
    puts "quack!"
  end
end
animal.speak
# => "quack!"