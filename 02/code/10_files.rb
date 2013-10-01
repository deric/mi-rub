#!/bin/ruby

File.open("testfile","w") {|f|
  f << "test line 1\n" << "test line 2\n"
}

File.open("testfile","r") {|f|
  puts f.readlines
}

f = File.open("testfile","r") {|f|
  puts f.readline
}

f = File.open("testfile","w")
f << "test line -- no block 1\n" << "test line -- no block 2\n"
f.close

f = File.open("testfile","r")
puts "first line: %s " % f.readline
f.close

f = File.open("testfile","r")
  i = 1
  f.each do |line|
    puts "#{i}: #{line}"
    i+= 1
  end
f.close