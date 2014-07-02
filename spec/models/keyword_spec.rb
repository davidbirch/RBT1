require 'rails_helper'

RSpec.describe Keyword, :type => :model do
  
  it "has a valid factory" do
    expect(FactoryGirl.create(:keyword)).to be_valid
  end
     
  it "can be created without a user" do
    @keyword = FactoryGirl.create(:keyword)
    expect(@keyword).to_not eq(nil)
    expect(@keyword.user).to eq(nil)  
  end
  
end
