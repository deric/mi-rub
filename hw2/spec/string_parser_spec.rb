#!/usr/bin/env ruby
$LOAD_PATH << './'
require 'spec_helper'
require 'string_parser'
require 'grid'

describe StringParser do
  subject { StringParser }

  it 'checks if argument is supported' do
    expect(subject.supports?('')).to eq false
    expect(subject.supports?(nil)).to eq false
    expect(subject.supports?(123)).to eq false
    expect(subject.supports?('a' * 81)).to eq false
  end

  it 'should recognize correct input' do
    inp = '003020600900305001001806400008102900700000008006708200002609500800203009005010300'
    expect(subject.supports?(inp)).to eq true
  end

  it 'should recognize correct input' do
    inp = '4.....8.5.3..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4......'
    expect(subject.supports?(inp)).to eq true
  end

  it 'should return Grid object' do
    inp = '4.....8.5.3..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4......'
    expect(subject.load(inp).class).to eq Grid
  end
end
