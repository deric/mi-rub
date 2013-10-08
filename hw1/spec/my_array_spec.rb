require 'rspec'
require 'spec_helper'
require_relative '../my_array'

describe MyArray do

  it "should have a method for determining size" do
    ary = MyArray.new
    ary.size.should eq 0
  end

  it "should copy data from an Array" do
    ary = MyArray.new([1, 2, 3])
    ary.size.should eq 3
  end

  context "each" do
    subject { MyArray.new(data) }

    let(:data) { [2, 5, 3]}
    its([0]) { should == 2 }
    its([1]) { should == 5 }
    its([2]) { should == 3 }

    it "iterate over data" do
      d = []
      subject.each { |i|
        d << i
      }
      d.should eq data
    end

    it "should work without passed block" do
      subject.each
    end

    it "should return an Enumerator" do
      res = subject.each
      res.class.should eq Enumerator
      res.to_a.should eq data
    end

  end

  context "reverse" do
    subject { MyArray.new(data) }

    let(:data) { [2, 5, 3]}
    let(:revdata) { [3, 5, 2]}

    it "should support reverse_each" do
      d = []
      MyArray.new([2, 5, 3]).reverse_each { |i|
        d << i
      }
      d.should eq [3, 5, 2]
    end

    it "should work without passed block" do
      subject.reverse
    end

    it "should return Array" do
      res = subject.reverse
      res.class.should eq Array
      res.to_a.should eq revdata
    end

    it "should support self-modifying reverse!" do
      subject.reverse!
      d = []
      subject.each {|i|
        d << i
      }
      d.should eq [3, 5, 2]
    end
  end

  context "pop" do
    subject { MyArray.new(data) }

    let(:data) { [2, 5, 3]}

    it "should have method pop" do
      subject.pop
    end

    it "should return the last element" do
      elem = subject.pop
      elem.should eq 3
    end

    it "should remove the last element" do
      expect{ subject.pop }.to change{ subject.size }.from(3).to(2)
    end
  end

  context "select" do
    subject { MyArray.new(data) }

    let(:data) { [1, 2, 3, 4, 5, 6]}

    it "should select even numbers" do
      res = subject.select { |num|  num.even?  }
      res.should eq [2, 4, 6]
    end
  end

  context "collect" do
    subject { MyArray.new(data) }

    let(:data) { [ "a", "b", "c", "d" ]}

    it "should iterate over elements and collect block results" do
      res = subject.collect {|x| x << "!" }
      res.should eq ["a!", "b!", "c!", "d!"]
    end

    it "should return Enumerator" do
      res = subject.collect
      res.class.should eq Enumerator
    end
  end

  context "clear" do

    subject { MyArray.new(data) }

    let(:data) { [ "a", "b", "c", "d" ]}

    it "should remove all elements" do
      expect{ subject.clear }.to change{ subject.size }.from(4).to(0)
    end
  end


  context "include?" do

    subject { MyArray.new(data) }

    let(:data) { [ 2, 5, 15, 23 ]}

    it "should return true if an element is in array" do
      res = subject.include?(5)
      res.should == true
    end

    it "should return false if an element is not in array" do
      res = subject.include?('duck')
      res.should == false
    end
  end


  context "max" do

    subject { MyArray.new(data) }

    let(:data) { (1..50).to_a }

    it "should return maximum value" do
      res = subject.max
      res.should == 50
    end

    context "with block" do
      let(:data) { %w(dog horse albatross duck) }

      it "should compare length of strings" do
        res = subject.max { |a, b| a.length <=> b.length }
        res.should eq "albatross"
      end
    end

  end

end
