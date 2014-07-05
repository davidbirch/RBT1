require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET index" do
    before :each do
      @user = FactoryGirl.create(:user)
      get :index
    end
    
    it "assigns all users as @users" do
      expect(assigns(:users)).to eq([@user])
    end
  end

  describe "GET show" do
    before :each do
      @user = FactoryGirl.create(:user)
      get :show, {:id => @user.to_param} 
    end
    
    it "assigns the requested user as @user" do
      expect(assigns(:user)).to eq(@user)
    end
  end

  describe "GET new" do
    before :each do
      get :new, {}  
    end
    
    it "assigns a new user as @user" do
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "GET edit" do
    before :each do
      @user = FactoryGirl.create(:user)
      get :edit, {:id => @user.to_param}
    end
    
    it "assigns the requested user as @user" do
      expect(assigns(:user)).to eq(@user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before :each do
        post :create, {user: FactoryGirl.attributes_for(:user)}
      end
          
      it "creates a new User" do
        expect(User.count).to eq(1)
      end
 
      it "assigns a newly created user as @user" do
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the created user" do
        expect(response).to redirect_to(User.last)
      end
    end

    describe "with invalid params" do
      before :each do
        post :create, {user: FactoryGirl.attributes_for(:user, screen_name: nil)}
      end
     
      it "does not save the new user" do
        expect(User.count).to eq(0)
      end
      
      it "re-renders the new method" do
        expect(response).to render_template("users/new")
      end       
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before :each do
        @user = FactoryGirl.create(:user)
        put :update, {:id => @user.to_param, :user => {:followers_count => 12345}}
        @user.reload
      end
    
      it "updates the requested user" do
        expect(assigns(:user).followers_count).to eq(12345)
      end

      it "assigns the requested user as @user" do
        expect(assigns(:user)).to eq(@user)
      end

      it "redirects to the user" do
        expect(response).to redirect_to(@user)
      end
    end

    describe "with invalid params" do
      before :each do
        @user = FactoryGirl.create(:user)
        put :update, {:id => @user.to_param, :user => {:screen_name => nil}}
        @user.reload        
      end
      
      it "assigns the user as @user" do
        expect(assigns(:user)).to eq(@user)
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template("users/edit")
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @user = FactoryGirl.create(:user)
      delete :destroy, {:id => @user.to_param}
    end
    
    it "destroys the requested user" do
      expect(User.count).to eq(0)
    end

    it "redirects to the users list" do
      expect(response).to redirect_to(users_url)
    end
  end

end
