require 'rails_helper'

RSpec.describe "filters/new", :type => :view do
  before(:each) do
    assign(:filter, Filter.new(
      :filter_value => "MyString",
      :user_id => 1
    ))
  end

  it "renders new filter form" do
    render

    assert_select "form[action=?][method=?]", filters_path, "post" do

      assert_select "input#filter_filter_value[name=?]", "filter[filter_value]"

      assert_select "input#filter_user_id[name=?]", "filter[user_id]"
    end
  end
end
