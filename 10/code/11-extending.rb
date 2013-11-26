#!/usr/bin/env ruby

class D
  def x; puts 'x' ; end
end

class D
  def y; puts 'y' ; end
end

obj = D.new
obj.x
obj.y