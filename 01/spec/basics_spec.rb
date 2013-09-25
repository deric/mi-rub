require 'rspec'
require 'spec_helper'
require_relative '../basics.rb'

describe "basics" do

  it "should know the meaning of the world" do
    meaning_of_the_world.should == 42
  end

  it "should return 3 elements in an array" do
    array_with_three_elements.class.should eq Array
    array_with_three_elements.size.should eq 3
  end

  it "should return hash" do
    subj = hash_with_one_key
    subj.class.should eq Hash
    subj.size.should eq 1
  end
  
  context "reverse things into other things" do
    
    it "should reverse text in argument" do
      subj = reverse_arg("dog")
      subj.should eq "god"
    end

    it "should reverse array in argument" do
      subj = reverse_arg([5, 8, 4])
      subj.should eq [4, 8, 5]
    end
  end

  it "should convert to upper case" do
    subj = capitalize_arg("hello world")
    subj.should eq "HELLO WORLD"
  end

  it "should return 3rd element of string" do
    subj = third_elem("ahoj")
    subj.should eq "o"
  end

  it "should return 3rd element of an array" do
    subj = third_elem([1, 2, 3, 4])
    subj.should eq 3
  end

  it "should return nil" do
    subj = third_elem("cz")
    subj.should eq nil
  end
end