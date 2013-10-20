#!/usr/bin/env ruby
$LOAD_PATH << './'
require 'spec_helper'
require 'sudoku'

describe Sudoku do
  subject { Sudoku.new(game) }
  let(:game) {'006002800050130020402500901900070540020801090087050002208009305040018070003600100'}

  it 'should know when game is solved' do
    expect(subject.solved?).to eq false
  end

  it 'should solve' do
    expect { subject.solve }.to change {
      subject.solved?
    }.from(false).to(true)
  end

  describe 'simple' do
    let(:game) {'010780000090600045002500100000000567800020003136000000007009400620007050000051030'}
    it 'should solve' do
      expect { subject.solve }.to change {
        subject.solved?
      }.from(false).to(true)
    end
  end

  describe 'simple 2' do
    let(:game) {'003020600900305001001806400008102900700000008006708200002609500800203009005010300'}
    it 'should solve' do
      expect { subject.solve }.to change {
        subject.solved?
      }.from(false).to(true)
    end
  end

  describe 'incomplete/invalid games' do
    let(:game) { '' }
    it 'checks whether grid has valid data' do
      expect { subject.valid? }.to raise_error RuntimeError
    end
  end
end
