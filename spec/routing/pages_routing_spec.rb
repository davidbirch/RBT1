require "rails_helper"

RSpec.describe PagesController, :type => :routing do
  
  describe "routing" do
    
    it "to /" do
      expect(:get => "/").to route_to("pages#home")
    end
  
    it "to /about" do
      expect(:get => "/about").to route_to("pages#about")
    end

  end
  
end
