#!/usr/bin/env ruby

animal = "cat"
"dog".instance_exec(animal) do |other|
    puts "#{other} and #{self}"
end