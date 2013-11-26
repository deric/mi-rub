#!/usr/bin/env ruby

class Test
  @var = 99
  @@foo = 42
  class << self
    attr_accessor :var

    def foo
      @@foo
    end
  end
end

class Subclass < Test
  @@foo = 7
  @var = 1
end

puts "Test var = #{Test.var}"
puts "Subclass var = #{Subclass.var}"
puts "Test foo = #{Test.foo}"
puts "Subclass foo = #{Subclass.foo}"
puts "Subclass = #{Subclass.class_variables}"

puts "Original value = #{Test.var}"
Test.var = "cat"
puts "New value = #{Test.var}"
puts "Class variables = #{Test.class_variables}"
