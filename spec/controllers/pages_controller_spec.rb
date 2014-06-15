require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  describe "GET home" do
    it "renders the root url" do
      get :home
      expect(response).to render_template(:home)  
    end
  end
  
  describe "GET about" do
    it "renders the about url" do
      get :about
      expect(response).to render_template(:about)
    end
  end

end
