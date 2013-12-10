require 'spec_helper'

describe Occupation do

  before(:all) do
    # build doesn't save object, #create saves object to a database
    @occupation = FactoryGirl.build(:occupation)
  end

  it "has a valid factory" do
    @occupation.should be_valid
  end

  it "is invalid without a title " do
    FactoryGirl.build(:occupation, title: nil).should_not be_valid
  end
end
