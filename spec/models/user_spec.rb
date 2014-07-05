require 'rails_helper'

RSpec.describe User, :type => :model do
  
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  
  it "has one keyword" do
    expect(FactoryGirl.create(:user)).to have_one(:keyword) 
  end
  
  it "has one filter" do
    expect(FactoryGirl.create(:user)).to have_one(:filter) 
  end
  
  it "validates presence of :screen_name" do
    expect(FactoryGirl.create(:user)).to validate_presence_of :screen_name
  end
  
  it "assigns the keyword on creation" do
    user = FactoryGirl.create(:user)
    keyword = user.keyword
    expect(keyword).to_not be_nil
    expect(keyword.keyword_value).to eq("@"+user.screen_name.to_s)
  end

  it "assigns the keyword on update" do
    user = FactoryGirl.create(:user)
    user.screen_name = "Another"
    user.save
    keyword = user.keyword
    expect(keyword).to_not be_nil
    expect(keyword.keyword_value).to eq("@"+user.screen_name.to_s)
  end

  it "destroys the keyword on destroy" do
    user = FactoryGirl.create(:user)
    keyword = user.keyword
    user.destroy
    expect(keyword.destroyed?)  
  end
  
  it "assigns the filter on creation" do
    user = FactoryGirl.create(:user)
    filter = user.filter
    expect(filter).to_not be_nil
    expect(filter.filter_value).to eq(user.user_guid)
  end

  it "assigns the filter on update" do
    user = FactoryGirl.create(:user)
    user.user_guid = 123456789
    user.save
    filter = user.filter
    expect(filter).to_not be_nil
    expect(filter.filter_value).to eq(user.user_guid)
  end

  it "destroys the filter on destroy" do
    user = FactoryGirl.create(:user)
    filter = user.filter
    user.destroy
    expect(filter.destroyed?)  
  end
  
end
