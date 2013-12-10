require "rspec"
require 'spec_helper'
require_relative '../word_count'


describe "word count" do

  it "should work with Hamlet monologue" do
    res = word_count("#{File.dirname(__FILE__)}/words/03.txt")
    res.should be_an_instance_of Hash
    res.has_key?("to").should be true
    res.has_key?("be").should be true
    res.has_key?("or").should be true
    res.has_key?("not").should be true
    res["to"].should eq 15
    res["be"].should eq 4
  end
end

