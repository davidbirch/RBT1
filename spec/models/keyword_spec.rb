require 'rails_helper'

RSpec.describe Keyword, :type => :model do
  
  it "has a valid factory" do
    expect(FactoryGirl.build(:keyword)).to be_valid
  end
  
  it "belongs to a user" do
    expect(FactoryGirl.build(:keyword)).to belong_to(:user) 
  end
  
  it "validates presence of :keyword_value" do
    expect(FactoryGirl.build(:keyword)).to validate_presence_of :keyword_value
  end
     
  it "can be created without a user" do
    keyword = FactoryGirl.create(:keyword)
    expect(keyword).to_not eq(nil)
    expect(keyword.user).to eq(nil)  
  end
  
end
