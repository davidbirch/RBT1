require "rails_helper"

RSpec.describe AccountLookupsController, :type => :routing do
  
  describe "routing" do
    
    it "routes to #new" do
      expect(:get => "/account_lookups/new").to route_to("account_lookups#new")
    end
  
  end
  
end
