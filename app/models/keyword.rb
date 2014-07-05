class Keyword < ActiveRecord::Base
  belongs_to :user
  
  validates :keyword_value, presence: true
  
end
