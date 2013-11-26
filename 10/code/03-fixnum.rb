#!/usr/bin/env ruby

class Fixnum
  def hours
     self * 3600
  end

 def from_now
   Time.now + self
 end
end

puts "By #{3.hours.from_now} I'll finish my homework"