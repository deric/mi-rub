#!/bin/ruby

require_relative 'distance'
data = Array.new(100000) { Array.new(10) { rand } }
bench = run(data)