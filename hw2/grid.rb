#!/usr/bin/env ruby

# Contains sudoku game board
class Grid

  # Created Sudoku game grid of given dimension
  def initialize(dimension)

  end

  # Return string with game board in console friendly format
  def to_s(width = 3)
    res = ''

  end

  # First element in the sudoku grid
  def first

  end

  # Last element in the sudoku grid
  def last

  end

  # Return value at given position
  def value(x, y)

  end

  # Sets value at given position
  def value=(x, y, value)

  end

  # Marks number @z@ which shouldn't at position [x, y]
  def exclude(x, y, z)

  end

  # True when there is alread a number
  def filled?(x, y)

  end

  # True when no game was loaded
  def empty?

  end

  # Yields elements in given row
  def row_elems(x)

  end

  # Yields elements in given column
  def col_elems(y)

  end

  # Yields elements from block which is
  # containing element at given position
  def block_elems(x, y)

  end

  # With one argument return row, with 2, element
  # at given position
  def [](*args)

  end

  # With one argument sets row, with 2 element
  def []=(*args)

  end

  # Return number of missing numbers in grid
  def missing

  end

  # Numer of filled cells
  def filled

  end

  # Number of row in this sudoku
  def rows

  end

  # Number of columns in this sudoku
  def cols

  end

  # Iterates over all elements, left to right, top to bottom
  def each

  end

  # Return true is no filled number break sudoku rules
  def valid?

  end

  # Serialize grid values to a one line string
  def solution

  end
end