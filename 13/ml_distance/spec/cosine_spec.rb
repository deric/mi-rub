require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "MlDistance" do

  context "Dot Product" do
    it "should return 50" do
      [5, 5].dot_product([5, 5]).should == 50.0
    end
  end

  context "cosine similarity" do

    it "should compute cosine similarity" do
      x = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]
      y = [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1]
      expect(x.cosine(y)).to eq 0.33333333333333337
    end

    it "should compute cosine similarity" do
      x = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]
      y = [1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1]
      expect(x.cosine(y)).to eq 0.5163977794943222
    end
  end
end