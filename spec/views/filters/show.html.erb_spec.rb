require 'rails_helper'

RSpec.describe "filters/show", :type => :view do
  before(:each) do
    @filter = assign(:filter, Filter.create!(
      :filter_value => 12345,
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/12345/)
    expect(rendered).to match(/1/)
  end
end
