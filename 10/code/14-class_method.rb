#!/usr/bin/env ruby

duck = Class.new do
  def self.speak
      puts "quack!"
  end
end
duck.speak
# => "quack!"