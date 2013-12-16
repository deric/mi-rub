require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "MlDistance" do

  context "Euclidean Distance" do

    subject { [5, 5] }

    it "should have 'euclidean' method" do
      subject.respond_to?(:euclidean)
    end

    it "should return 0.0" do
      subject.euclidean(subject).should == 0.0
    end

    it "should be 4.0" do
      [5].euclidean([1]).should == 4.0
    end

    it "two dimensions vector" do
      [1, 6].euclidean([4, 2]).should == 5.0
    end

    it "should raise an error in case of different vector sizes" do
      expect { [1].euclidean([1, 2])}.to raise_error(ArgumentError)
    end
  end

end
