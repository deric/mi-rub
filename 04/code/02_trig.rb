#!/bin/ruby

module Moral
  VERY_BAD = 0
  BAD = 1
  def Moral.sin(badness)
  # ...
  end
end

module Trig
  PI = 3.141592654
  def Trig.sin(x)
  # ..
  end
  def Trig.cos(x)
  # ..
  end
end

y = Trig.sin(Trig::PI/4)
wrongdoing = Moral.sin(Moral::VERY_BAD)
