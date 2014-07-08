require 'rails_helper'

RSpec.describe Filter, :type => :model do
  
  it "has a valid factory" do
    expect(FactoryGirl.build(:filter)).to be_valid
  end
 
  it "belongs to a user" do
    expect(FactoryGirl.build(:filter)).to belong_to(:user) 
  end
  
  it "validates presence of :filter_value" do
    expect(FactoryGirl.build(:filter)).to validate_presence_of :filter_value
  end
  
  it "can be created without a user" do
    filter = FactoryGirl.create(:filter)
    expect(filter).to_not eq(nil)
    expect(filter.user).to eq(nil)  
  end  
  
end
