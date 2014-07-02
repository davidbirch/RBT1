require 'rails_helper'

RSpec.describe Filter, :type => :model do
  
  it "has a valid factory" do
    expect(FactoryGirl.create(:filter)).to be_valid
  end
  
  it "can be created without a user" do
    @filter = FactoryGirl.create(:filter)
    expect(@filter).to_not eq(nil)
    expect(@filter.user).to eq(nil)  
  end  
  
end
