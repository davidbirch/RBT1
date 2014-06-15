require 'rails_helper'

RSpec.describe AccountLookupsController, :type => :controller do

  describe "GET new" do
    it "renders the new url" do
      get :new
      expect(response).to render_template(:new)  
    end
  end

end
