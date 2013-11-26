#!/usr/bin/env ruby

3.times do
  class C
    puts "Hello from #{self.__id__}"
  end
end