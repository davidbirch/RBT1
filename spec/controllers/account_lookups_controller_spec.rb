require 'rails_helper'

RSpec.describe AccountLookupsController, :type => :controller do

  describe "GET index" do
    before :each do
      get :index
    end
        
    it "renders the index url" do
      expect(response).to render_template(:index)  
    end
    it "assigns a new account_lookup as @account_lookup" do
      expect(assigns(:account_lookup)).to be_a(AccountLookup)
    end 
  end

  describe "POST create with a valid :screen_name" do
    before :each do
      post :create, {:account_lookup => { :screen_name => "gem"}}
    end
    
    it "renders the create url" do
      expect(response).to render_template(:index)  
    end
    it "assigns a new account_lookup as @account_lookup" do
      expect(assigns(:account_lookup)).to be_a(AccountLookup)
    end
  end
  
  describe "POST create with a blank :screen_name" do
    before :each do
      post :create, {:account_lookup => { :screen_name => ""}}
    end
    
    it "renders the create url" do
      expect(response).to render_template(:index)  
    end
    it "assigns a new account_lookup as @account_lookup" do
      expect(assigns(:account_lookup)).to be_a(AccountLookup)
    end
  end

  describe "POST create with a blocked :screen_name" do
    before :each do
      post :create, {:account_lookup => { :screen_name => "test"}}
    end
    
    it "renders the create url" do
      expect(response).to render_template(:index)  
    end
    it "assigns a new account_lookup as @account_lookup" do
      expect(assigns(:account_lookup)).to be_a(AccountLookup)
    end
    it "assigns a message to flash error" do
      expect(flash.now[:error]).not_to be(nil)
    end
  end

end
