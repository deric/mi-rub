#!/usr/bin/env ruby

module Talking
  def speak
    puts "quack!"
  end
end

animal = "duck"
animal.extend Talking
animal.speak
# => "quack!"