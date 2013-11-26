#!/usr/bin/env ruby

class Fixnum
  def +(other)
    self * other
  end
end

puts "3 + 4 = #{3 + 4}"