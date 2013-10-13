class Polygon
  @@sides = 10
  def self.sides
    @@sides
  end
end

puts "Polygon sides = %d" % Polygon.sides # => 10

class Triangle < Polygon
  @@sides = 3
end

puts "Triangle sides = %d" % Triangle.sides # => 3
puts "Polygon sides = %d" % Polygon.sides # => 3