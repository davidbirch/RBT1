require 'rails_helper'

RSpec.describe "keywords/new", :type => :view do
  before(:each) do
    assign(:keyword, Keyword.new(
      :keyword_value => "MyString",
      :user_id => 1
    ))
  end

  it "renders new keyword form" do
    render

    assert_select "form[action=?][method=?]", keywords_path, "post" do

      assert_select "input#keyword_keyword_value[name=?]", "keyword[keyword_value]"

      assert_select "input#keyword_user_id[name=?]", "keyword[user_id]"
    end
  end
end
