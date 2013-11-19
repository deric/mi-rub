# This file is called simpleNumber.rb
# It contains the class SimpleNumber

class SimpleNumber

  def initialize( num )
    raise if !num.is_a?(Numeric)
    @x = num
  end

  def add( y )
    @x + y
  end

  def multiply( y )
    @x * y
  end

end