#!/usr/bin/env ruby

class TestSuite
  def run
    self.methods.grep(/^test/).each { |m| send m }
  end

  def test_one_thing
    puts "I'm testing one thing"
  end

  def test_another_thing
    puts "I'm testing another thing"
  end

  def test_something
    puts "I'm testing something thing"
  end
end

TestSuite.new.run