require 'spec_helper'

describe "authors/index" do
  before(:each) do
    assign(:authors, [
      stub_model(Author,
        :firstname => "Firstname",
        :surname => "Surname",
        :title_before => "Title Before",
        :title_after => "Title After"
      ),
      stub_model(Author,
        :firstname => "Firstname",
        :surname => "Surname",
        :title_before => "Title Before",
        :title_after => "Title After"
      )
    ])
  end

  it "renders a list of authors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Surname".to_s, :count => 2
    assert_select "tr>td", :text => "Title Before".to_s, :count => 2
    assert_select "tr>td", :text => "Title After".to_s, :count => 2
  end
end
