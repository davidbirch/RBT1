# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "The Ruby Gem"
    screen_name "gem"
    user_guid 213747670
    followers_count 1462
    profile_background_image_url "http://abs.twimg.com/images/themes/theme1/bg.png"
  end
end
