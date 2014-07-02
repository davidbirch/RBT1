require 'rails_helper'

RSpec.describe "keywords/edit", :type => :view do
  before(:each) do
    @keyword = assign(:keyword, Keyword.create!(
      :keyword_value => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit keyword form" do
    render

    assert_select "form[action=?][method=?]", keyword_path(@keyword), "post" do

      assert_select "input#keyword_keyword_value[name=?]", "keyword[keyword_value]"

      assert_select "input#keyword_user_id[name=?]", "keyword[user_id]"
    end
  end
end
