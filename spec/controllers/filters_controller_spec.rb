require 'rails_helper'

RSpec.describe FiltersController, :type => :controller do

  describe "GET index" do
    before :each do
      @filter = FactoryGirl.create(:filter)
      get :index
    end
       
    it "assigns all filters as @filters" do
      expect(assigns(:filters)).to eq([@filter])
    end
  end

  describe "GET show" do
    before :each do
      @filter = FactoryGirl.create(:filter)
      get :show, {:id => @filter.to_param} 
    end
     
    it "assigns the requested filter as @filter" do
      expect(assigns(:filter)).to eq(@filter)
    end
  end

  describe "GET new" do
    before :each do
      get :new, {}  
    end
        
    it "assigns a new filter as @filter" do
      expect(assigns(:filter)).to be_a_new(Filter)
    end
  end

  describe "GET edit" do
    before :each do
      @filter = FactoryGirl.create(:filter)
      get :edit, {:id => @filter.to_param}
    end
       
    it "assigns the requested filter as @filter" do
      expect(assigns(:filter)).to eq(@filter)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before :each do
        post :create, {filter: FactoryGirl.attributes_for(:filter)}
      end
          
      it "creates a new Filter" do
        expect(Filter.count).to eq(1)
      end

      it "assigns a newly created filter as @filter" do
        expect(assigns(:filter)).to be_a(Filter)
        expect(assigns(:filter)).to be_persisted
      end

      it "redirects to the created filter" do
        expect(response).to redirect_to(Filter.last)
      end
    end

    describe "with invalid params" do
      it "does not save the new user" do
        pending "placeholder for invalid attributes"
        fail
      end
      
      it "re-renders the new method" do
        pending "placeholder for invalid attributes"
        fail
      end 
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before :each do
        @filter = FactoryGirl.create(:filter)
        put :update, {:id => @filter.to_param, :filter => {:filter_value => 23456}}
        @filter.reload
      end

      it "updates the requested filter" do
        expect(assigns(:filter).filter_value).to eq(23456)
      end

      it "assigns the requested user as @filter" do
        expect(assigns(:filter)).to eq(@filter)
      end

      it "redirects to the filter" do
        expect(response).to redirect_to(@filter)
      end
    end

    describe "with invalid params" do
      it "assigns the filter as @filter" do
        pending "placeholder for invalid attributes"
        fail
      end

      it "re-renders the 'edit' template" do
        pending "placeholder for invalid attributes"
        fail
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @filter = FactoryGirl.create(:filter)
      delete :destroy, {:id => @filter.to_param}
    end
    
    it "destroys the requested filter" do
      expect(Filter.count).to eq(0)
    end

    it "redirects to the filters list" do
      expect(response).to redirect_to(filters_url)
    end
  end

end
