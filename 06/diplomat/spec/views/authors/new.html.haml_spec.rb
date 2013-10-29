require 'spec_helper'

describe "authors/new" do
  before(:each) do
    assign(:author, stub_model(Author,
      :firstname => "MyString",
      :surname => "MyString",
      :title_before => "MyString",
      :title_after => "MyString"
    ).as_new_record)
  end

  it "renders new author form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", authors_path, "post" do
      assert_select "input#author_firstname[name=?]", "author[firstname]"
      assert_select "input#author_surname[name=?]", "author[surname]"
      assert_select "input#author_title_before[name=?]", "author[title_before]"
      assert_select "input#author_title_after[name=?]", "author[title_after]"
    end
  end
end
