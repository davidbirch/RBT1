class Filter < ActiveRecord::Base
  belongs_to :user
  
  validates :filter_value, presence: true
  
end
