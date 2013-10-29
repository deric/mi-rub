require 'spec_helper'

describe "authors/show" do
  before(:each) do
    @author = assign(:author, stub_model(Author,
      :firstname => "Firstname",
      :surname => "Surname",
      :title_before => "Title Before",
      :title_after => "Title After"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Firstname/)
    rendered.should match(/Surname/)
    rendered.should match(/Title Before/)
    rendered.should match(/Title After/)
  end
end
