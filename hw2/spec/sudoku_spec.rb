#!/usr/bin/env ruby
$LOAD_PATH << './'
require 'spec_helper'
require 'sudoku'

describe Sudoku do
  subject { Sudoku.new(game) }
  let(:game) do
    '006002800050130020402500901900070540020801090087050002208009305040018070003600100'
  end

  it 'should know when game is solved' do
    expect(subject.solved?).to eq false
  end

  it 'should solve' do
    expect { subject.solve }.to change {
      subject.solved?
    }.from(false).to(true)
    expect(subject.solution).to eq(
      '136492857859137426472586931961273548524861793387954612218749365645318279793625184'
    )
  end

  describe 'simple' do
    let(:game) do
      '010780000090600045002500100000000567800020003136000000007009400620007050000051030'
    end

    it 'should solve' do
      expect { subject.solve }.to change {
        subject.solved?
      }.from(false).to(true)
      expect(subject.solution).to eq(
        '513784692798612345462593178249138567875426913136975284357869421621347859984251736'
      )
    end
  end

  describe 'simple 2' do
    let(:game) do
      '003020600900305001001806400008102900700000008006708200002609500800203009005010300'
    end

    it 'should solve' do
      expect { subject.solve }.to change {
        subject.solved?
      }.from(false).to(true)
      expect(subject.solution).to eq(
        '483921657967345821251876493548132976729564138136798245372689514814253769695417382'
      )
    end
  end

  describe 'incomplete/invalid games' do
    let(:game) { '' }
    it 'checks whether grid has valid data' do
      expect { subject.valid? }.to raise_error RuntimeError
    end
  end
end
