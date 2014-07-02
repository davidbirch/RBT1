require 'rails_helper'

RSpec.describe "filters/index", :type => :view do
  before(:each) do
    assign(:filters, [
      Filter.create!(
        :filter_value => 12345,
        :user_id => 1
      ),
      Filter.create!(
        :filter_value => 12345,
        :user_id => 1
      )
    ])
  end

  it "renders a list of filters" do
    render
    assert_select "tr>td", :text => 12345.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
