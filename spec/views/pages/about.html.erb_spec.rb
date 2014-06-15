require 'rails_helper'

RSpec.describe "pages/about", :type => :view do

  it "renders attributes in <h1>" do
    render
    expect(rendered).to match(/Pages#about/)
  end
end
