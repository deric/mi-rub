require 'spec_helper'

describe Author do

  it "has a valid factory" do
    FactoryGirl.create(:author).should be_valid
  end

  it "is invalid without a firstname" do
    FactoryGirl.build(:author, firstname: nil).should_not be_valid
  end

  it "is invalid without a surname" do
    FactoryGirl.build(:author, surname: nil).should_not be_valid
  end
end
