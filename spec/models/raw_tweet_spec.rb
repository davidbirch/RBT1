require 'rails_helper'

RSpec.describe RawTweet, :type => :model do
  
  it "has a valid factory" do
    expect(FactoryGirl.build(:raw_tweet)).to be_valid
  end
  
  it "validates presence of :raw" do
    expect(FactoryGirl.build(:raw_tweet)).to validate_presence_of :raw
  end
    
  it "validates presence of :tweet_guid" do
    expect(FactoryGirl.build(:raw_tweet)).to validate_presence_of :tweet_guid
  end
  
end
