class RawTweet < ActiveRecord::Base
  
  validates :raw, presence: true
  validates :tweet_guid, presence: true
   
end
