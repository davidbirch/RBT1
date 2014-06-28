require 'rails_helper'

RSpec.describe "users/edit", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "MyString",
      :screen_name => "MyString",
      :user_guid => 1,
      :followers_count => 1,
      :profile_background_image_url => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_screen_name[name=?]", "user[screen_name]"

      assert_select "input#user_user_guid[name=?]", "user[user_guid]"

      assert_select "input#user_followers_count[name=?]", "user[followers_count]"

      assert_select "input#user_profile_background_image_url[name=?]", "user[profile_background_image_url]"
    end
  end
end
