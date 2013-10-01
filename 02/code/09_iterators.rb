#!/bin ruby

puts "# for:"
for i in 1..10
  print i
end

puts "\n# 10.times:"
10.times {|i| print "#{i} "}

puts "\n# 1.upto(10):"
1.upto(10) {|i| print "#{i} "}

puts "\n# 1.step(10, 2):"
1.step(10, 2) { |i| print "#{i} "}
puts