#!/bin/ruby

def fibonacci(max=Float::INFINITY)
  return to_enum(__method__, max) unless block_given?
  yield previous = 0
  yield i = 1
  while true
    i, previous = previous + i, i
    break if i > max
    yield i
  end
  previous
end