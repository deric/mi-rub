#!/usr/bin/env ruby

$LOAD_PATH << './'
require 'rspec'
require 'spec_helper'
require 'grid'
require 'string_parser'

describe Grid do
  # StringParser should return Grid object with
  # loaded content
  subject { StringParser.load(game) }
  let(:game){ '003020600900305001001806400008102900700000008006708200002609500800203009005010300' }
  # to_s output
  # ---------+---------+---------
  #  0  0  3 | 0  2  0 | 6  0  0
  #  9  0  0 | 3  0  5 | 0  0  1
  #  0  0  1 | 8  0  6 | 4  0  0
  # ---------+---------+---------
  #  0  0  8 | 1  0  2 | 9  0  0
  #  7  0  0 | 0  0  0 | 0  0  8
  #  0  0  6 | 7  0  8 | 2  0  0
  # ---------+---------+---------
  #  0  0  2 | 6  0  9 | 5  0  0
  #  8  0  0 | 2  0  3 | 0  0  9
  #  0  0  5 | 0  1  0 | 3  0  0
  # ---------+---------+---------

  describe 'loaded data' do
    it 'has value method for accessing elements' do
      expect(subject.value(0, 0)).to eq 0
    end

    it 'returns row in sudoku grid' do
      expect(subject[0].map { |e| e.to_i }).to eq([0, 0, 3, 0, 2, 0, 6, 0, 0])
      expect(subject[4].map { |e| e.to_i }).to eq([7, 0, 0, 0, 0, 0, 0, 0, 8])
    end

    it 'has [x, y] method for accessing elements' do
      expect(subject[1, 0].to_i).to eq 9
      expect(subject[2, 3].to_i).to eq 8
      expect(subject[2, 5].to_i).to eq 6
      expect(subject[2, 6].to_i).to eq 4
      expect(subject[4, 0].to_i).to eq 7
      expect(subject[7, 0].to_i).to eq 8
      expect(subject[8, 8].to_i).to eq 0
    end

    it 'has to_s method' do
      expect(subject.respond_to?(:to_s)).to eq true
      res = subject.to_s
      expect(res.class).to eq String
      ary = res.split("\n")
      expect(ary.size).to eq 13
      expect(ary[0]).to eq('---------+---------+---------')
      expect(ary[1]).to eq('       3 |    2    | 6       ')
      expect(ary[0] == ary[12]).to eq true
    end
  end

  describe 'accessing data' do
    let(:game) { '4.....8.5.3..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4.....9' }

    it 'should return number of not filled elements' do
      expect(subject.missing).to eq 63
    end

    it 'return number of columns' do
      expect(subject.cols).to eq 9
    end

    it 'return number of rows' do
      expect(subject.rows).to eq 9
    end

    it 'should have method each' do
      i = 0
      subject.each do |e|
        expect(e.to_i).to eq game[i].to_i
        i += 1
      end
    end

    it 'should have method each returing Enumerator when block is not passed' do
      expect(subject.each.class).to eq Enumerator
    end

    it 'checks wheter grid has valid data' do
      expect(subject.valid?).to eq true
    end

    it 'has method for getting first element' do
      expect(subject.first.to_i).to eq 4
    end

    it 'has method for getting last element' do
      expect(subject.last.to_i).to eq 9
    end
  end

  describe 'setting values' do
    let(:game) { '4.....8.5.3..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4......' }
    it 'has loaded game' do
      expect(subject.missing).to eq 64
    end

    it 'can replace row' do
      row = [7, 0, 0, 0, 0, 0, 0, 0, 8]
      subject[0] = row
      expect(subject[0]).to eq row
    end

    it 'can set element at specific position' do
      subject[0, 0] = 5
      expect(subject[0, 0].to_i).to eq 5

      subject[0, 3] = 9
      expect(subject.value(0, 3)).to eq 9
    end
  end

  describe 'sub-block access' do
    #  9  0  0 | 3  0  5 | 0  0  1
    it 'yields row elements ' do
      res = []
      subject.row_elems(1) do |e|
        res << e.to_i
      end
      expect(res).to eq([9, 0, 0, 3, 0, 5, 0, 0, 1])
    end

    it 'yields column elements ' do
      res = []
      subject.col_elems(5) do |e|
        res << e.to_i
      end
      expect(res).to eq([0, 5, 6, 2, 0, 8, 9, 3, 0])
    end

    it 'yields middle block (sudoku square) elements ' do
      res = []
      # middle block
      subject.block_elems(3, 3) do |e|
        res << e.to_i
      end
      expect(res).to eq([1, 0, 2, 0, 0, 0, 7, 0, 8])
    end

    it 'yields first block (sudoku square) elements ' do
      res = []
      # first block
      subject.block_elems(1, 1) do |e|
        res << e.to_i
      end
      expect(res).to eq([0, 0, 3, 9, 0, 0, 0, 0, 1])
    end

    it 'yields last block (sudoku square) elements ' do
      res = []
      # first block
      subject.block_elems(8, 8) do |e|
        res << e.to_i
      end
      expect(res).to eq([5, 0, 0, 0, 0, 9, 3, 0, 0])
    end
  end

  describe 'validates grid' do
    let(:game) { '4.....8.5.3..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4......' }
    it 'validates current state of grid' do
      expect(subject.valid?).to eq true
    end

    it 'duplicate in row' do
      input = '44....8.5.3..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4......'
      g = StringParser.load(input)
      expect(g.valid?).to eq false
    end

    it 'duplicate in column' do
      input = '4.....8.543..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4......'
      g = StringParser.load(input)
      expect(g.valid?).to eq false
    end

    it 'duplicate in block' do
      input = '4.....8.5.4..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4......'
      g = StringParser.load(input)
      expect(g.valid?).to eq false
    end
  end

  it 'has solution method' do
    expect(subject.respond_to?(:solution)).to eq true
    expect(subject.solution).to eq ('003020600900305001001806400008102900700000008006708200002609500800203009005010300')
  end
end
