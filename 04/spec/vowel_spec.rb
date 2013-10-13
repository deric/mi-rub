#!/usr/bin/env ruby
$LOAD_PATH << './'
require_relative '../vowel_finder'
require 'spec_helper'

describe VowelFinder do
  it 'should find vowels' do
    vf = VowelFinder.new('the quick brown fox jumped')
    expect(vf.map.to_a).to eq(%w(e u i o o u e))
  end

  it 'should have a method `sum`' do
    vf = VowelFinder.new('hello')
    expect(vf.methods.include?(:sum)).to be true
  end

  it 'should perform a sum' do
    vf = VowelFinder.new('The quick brown fox jumps over the lazy dog')
    expect(vf.sum).to eq'euioouoeeayo'
  end

  it 'shoud handle capital letters ' do
    vf = VowelFinder.new('A CRARY BIG BUY JUMPS OVER A HORIZONTALLY
      SIGNIFICANT LADY')
    expect(vf.sum).to eq 'aayiuyuoeaoioayiiiaay'
  end

  it 'should include Summable module to Array class' do
    ary = [1, 2, 3]
    expect(ary.methods.include?(:sum)).to be true
  end

  it 'should include sum over Array class' do
    ary = [1, 2, 3, 4]
    expect(ary.sum).to eq 10
  end

  it 'should return an Enumerator' do
    vf = VowelFinder.new('hello')
    expect(vf.each.instance_of?(Enumerator)).to be true
  end
end
