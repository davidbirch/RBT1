require "rails_helper"

RSpec.describe AccountLookupsController, :type => :routing do
  
  describe "routing" do
    
    it "routes to #index" do
      expect(:get => "/account_lookups").to route_to("account_lookups#index")
    end
  
    it "routes to #create" do
      expect(:post => "/account_lookups").to route_to("account_lookups#create")
    end
  
  end
  
end
