require 'rails_helper'

RSpec.describe "keywords/show", :type => :view do
  before(:each) do
    @keyword = assign(:keyword, Keyword.create!(
      :keyword_value => "Keyword Value",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Keyword Value/)
    expect(rendered).to match(/1/)
  end
end
