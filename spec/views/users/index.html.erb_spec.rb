require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :screen_name => "Screen Name",
        :user_guid => 1,
        :followers_count => 2,
        :profile_background_image_url => "Profile Background Image Url"
      ),
      User.create!(
        :name => "Name",
        :screen_name => "Screen Name",
        :user_guid => 1,
        :followers_count => 2,
        :profile_background_image_url => "Profile Background Image Url"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Screen Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Profile Background Image Url".to_s, :count => 2
  end
end
