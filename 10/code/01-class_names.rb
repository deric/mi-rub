#!/usr/bin/env ruby

class Test
  def hello
    puts "hi"
  end
end

Test.new.hello
cls = Test
cls.new.hello
