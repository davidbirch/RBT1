require 'rails_helper'

RSpec.describe "pages/home", :type => :view do

  it "renders attributes in <h1>" do
    render
    expect(rendered).to match(/Pages#home/)
  end
end
