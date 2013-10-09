#!/usr/bin/env ruby
$LOAD_PATH << './'
require_relative '../duck'
require 'spec_helper'

describe Duck do
  before :each do
    @duck = Duck.new('Fanny', 2)
  end

  it 'should return a new Duck object' do
    @duck.should(be_an_instance_of Duck)
  end

  it 'should has name Fanny' do
    @duck.name.should eql 'Fanny'
  end

  it 'should quack' do
    @duck.quack.should eql 'quack quack'
  end

  it 'should be able to fly' do
    Duck.can_fly.should eq true
  end

  it 'should be able to swim' do
    Duck.can_swim.should eq true
  end

  it 'should not fly unless told to' do
    @duck.flying?.should eq false
  end

  it 'should not swim unless told to do that' do
    @duck.swimming?.should eq false
  end

  it 'should fly' do
    @duck.flying = true
    @duck.flying?.should eq true
  end

  it 'should swim' do
    @duck.swimming = true
    @duck.swimming?.should == true
  end

  it 'should count number of quacks' do
    @duck.quack
    @duck.num_quacks.should eq 2
    @duck.quack
    @duck.num_quacks.should eq 4
  end

  it 'shouldn\'t fly while it is swimming' do
    @duck.flying = true
    @duck.flying?.should eq true
    @duck.swimming = true
    @duck.flying?.should eq false
    @duck.swimming?.should eq true
  end

  it 'shouldn\'t swim while it is flying' do
    @duck.swimming = true
    @duck.flying = true
    @duck.flying?.should be true
    @duck.swimming?.should be false
  end

  it 'should count total number of quacks for all Ducks' do
    donald = Duck.new('Donald', 3)
    donald.quack
    Duck.num_quacks.should eq 8
  end

  it 'should consider age as a private matter!' do
    expect { @duck.age }.to raise_error NoMethodError
  end

  it 'should not increase number of quack without a quack' do
    expect { @duck.quack = 15 }.to raise_error NoMethodError
    expect { @duck.num_quacks = 15 }.to raise_error NoMethodError
  end

  it 'should not increase global number of quack without a quack' do
    expect { Duck.num_quacks = 15 }.to raise_error NoMethodError
  end

  it 'should compare which duck is older' do
    old_duck = Duck.new 'old one', 15
    @duck.compare(old_duck).should eq (-1)
    same_duck = Duck.new 'same age', 2
    @duck.compare(same_duck).should eq 0
    young_duck = Duck.new 'young duck', 1
    @duck.compare(young_duck).should eq 1
  end

  it 'should have fly! method' do
    @duck.fly!
    @duck.flying?.should eq true
    @duck.swimming?.should eq false
  end

  it 'fly! should use flying= method' do
    @duck.swimming = true
    @duck.fly!
    @duck.flying?.should eq true
    @duck.swimming?.should eq false
  end
end
