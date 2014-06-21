require 'rails_helper'

RSpec.describe AccountLookup, :type => :model do
  
  it "can be initiaized" do
    expect(AccountLookup.new).to be_a(AccountLookup)
  end  
  
  describe "when the screen name is blank" do
    
    before :each do
      @screen_name = ""
      @account_lookup = AccountLookup.new(screen_name: @screen_name)
    end
    
    it "can be initiaized" do
      expect(@account_lookup).to be_a(AccountLookup)
    end
    
    it "can request details from the twitter api" do
      @account_lookup.update_details_from_twitter
      expect(@account_lookup).to be_a(AccountLookup)
      expect(@account_lookup.screen_name).to eq(@screen_name)
      expect(@account_lookup.name).to eq(nil)
      expect(@account_lookup.error_message).to eq(nil)
    end 
  end
  
  describe "when the screen name is a blocked screen name" do
    
    before :each do
      @screen_name = "test"
      @expected_error = "User has been suspended."
      @account_lookup = AccountLookup.new(screen_name: @screen_name)
    end
    
    it "can be initiaized" do
      expect(@account_lookup).to be_a(AccountLookup)
    end
    
    it "can request details from the twitter api" do
      @account_lookup.update_details_from_twitter
      expect(@account_lookup).to be_a(AccountLookup)
      expect(@account_lookup.screen_name).to eq(@screen_name)
      expect(@account_lookup.name).to eq(nil)
      expect(@account_lookup.error_message).to eq(@expected_error)
    end  
  end
  
  describe "when the screen name is an unknown screen name" do
    
    before :each do
      @screen_name = "zxcvzxcvzxv"
      @expected_error = "Sorry, that page does not exist"
      @account_lookup = AccountLookup.new(screen_name: @screen_name)
    end
    
    it "can be initiaized" do
      expect(@account_lookup).to be_a(AccountLookup)
    end
    
    it "can request details from the twitter api" do
      @account_lookup.update_details_from_twitter
      expect(@account_lookup).to be_a(AccountLookup)
      expect(@account_lookup.screen_name).to eq(@screen_name)
      expect(@account_lookup.name).to eq(nil)
      expect(@account_lookup.error_message).to eq(@expected_error)
    end  
  end

  describe "when the screen name is a valid screen name" do
    
    before :each do
      @screen_name = "gem"
      @name = "The Ruby Gem"
      @account_lookup = AccountLookup.new(screen_name: @screen_name)
    end
    
    it "can be initiaized" do
      expect(@account_lookup).to be_a(AccountLookup)
    end
    
    it "can request details from the twitter api" do
      @account_lookup.update_details_from_twitter
      expect(@account_lookup).to be_a(AccountLookup)
      expect(@account_lookup.screen_name).to eq(@screen_name)
      expect(@account_lookup.name).to eq(@name)
      expect(@account_lookup.user_guid).not_to eq(nil)
      expect(@account_lookup.followers_count).not_to eq(nil)
      expect(@account_lookup.profile_background_image_url).not_to eq(nil)
      
      expect(@account_lookup.error_message).to eq(nil)
    end  
  end



end
