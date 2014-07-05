require 'rails_helper'

RSpec.describe KeywordsController, :type => :controller do

  describe "GET index" do
    before :each do
      @keyword = FactoryGirl.create(:keyword)
      get :index
    end
       
    it "assigns all keywords as @keywords" do
      expect(assigns(:keywords)).to eq([@keyword])
    end
  end

  describe "GET show" do
    before :each do
      @keyword = FactoryGirl.create(:keyword)
      get :show, {:id => @keyword.to_param} 
    end
    
    it "assigns the requested keyword as @keyword" do
      expect(assigns(:keyword)).to eq(@keyword)
    end
  end

  describe "GET new" do
    before :each do
      get :new, {}  
    end
        
    it "assigns a new keyword as @keyword" do
      expect(assigns(:keyword)).to be_a_new(Keyword)
    end
  end

  describe "GET edit" do
    before :each do
      @keyword = FactoryGirl.create(:keyword)
      get :edit, {:id => @keyword.to_param}
    end
       
    it "assigns the requested keyword as @keyword" do
      expect(assigns(:keyword)).to eq(@keyword)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before :each do
        post :create, {keyword: FactoryGirl.attributes_for(:keyword)}
      end
          
      it "creates a new Keyword" do
        expect(Keyword.count).to eq(1)
      end
 
      it "assigns a newly created keyword as @keyword" do
        expect(assigns(:keyword)).to be_a(Keyword)
        expect(assigns(:keyword)).to be_persisted
      end

      it "redirects to the created keyword" do
        expect(response).to redirect_to(Keyword.last)
      end
    end

    describe "with invalid params" do
      before :each do
        post :create, {keyword: FactoryGirl.attributes_for(:keyword, keyword_value: nil)}
      end
     
      it "does not save the new keyword" do
        expect(Keyword.count).to eq(0)
      end
      
      it "re-renders the new method" do
        expect(response).to render_template("keywords/new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before :each do
        @keyword = FactoryGirl.create(:keyword)
        put :update, {:id => @keyword.to_param, :keyword => {:keyword_value => "another"}}
        @keyword.reload
      end

      it "updates the requested keyword" do
        expect(assigns(:keyword).keyword_value).to eq("another")
      end

      it "assigns the requested keyword as @keyword" do
        expect(assigns(:keyword)).to eq(@keyword)
      end

      it "redirects to the keyword" do
        expect(response).to redirect_to(@keyword)
      end
    end

    describe "with invalid params" do
      before :each do
        @keyword = FactoryGirl.create(:keyword)
        put :update, {:id => @keyword.to_param, :keyword => {:keyword_value => nil}}
        @keyword.reload        
      end
      
      it "assigns the keyword as @keyword" do
        expect(assigns(:keyword)).to eq(@keyword)
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template("keywords/edit")
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @keyword = FactoryGirl.create(:keyword)
      delete :destroy, {:id => @keyword.to_param}
    end
    
    it "destroys the requested keyword" do
      expect(Keyword.count).to eq(0)
    end

    it "redirects to the keywords list" do
      expect(response).to redirect_to(keywords_url)
    end
  end

end
