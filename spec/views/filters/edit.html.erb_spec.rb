require 'rails_helper'

RSpec.describe "filters/edit", :type => :view do
  before(:each) do
    @filter = assign(:filter, Filter.create!(
      :filter_value => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit filter form" do
    render

    assert_select "form[action=?][method=?]", filter_path(@filter), "post" do

      assert_select "input#filter_filter_value[name=?]", "filter[filter_value]"

      assert_select "input#filter_user_id[name=?]", "filter[user_id]"
    end
  end
end
