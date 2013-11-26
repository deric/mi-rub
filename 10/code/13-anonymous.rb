#!/usr/bin/env ruby

animal = 'duck'
class << animal
  def speak
      puts 'quack!'
  end
end
animal.speak
# => "quack!"