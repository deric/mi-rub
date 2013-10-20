#!/bin/ruby
require 'grid'
require 'string_parser'

# Basic sudoku solver
class Sudoku

  PARSERS = [StringParser]

  def initialize(game)
    @grid = load(game)
  end

  # Return true when there is no missing number
  def solved?
    @grid.nil? && @grid.missing == 0
  end

  # Solves sudoku and returns 2D Grid
  def solve
    raise 'invalid game given' unless @grid.valid?
    puts "missing values #{@grid.missing}, filled #{@grid.filled}"

  end

  protected

  def load(game)
    PARSERS.each do |p|
      return p.load(game) if p.supports?(game)
    end
    raise "input '#{game.to_s}' is not supported yet"
  end

end
