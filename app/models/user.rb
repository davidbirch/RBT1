class User < ActiveRecord::Base
  has_one :keyword, dependent: :destroy
  has_one :filter, dependent: :destroy
  
  after_save :assign_keyword
  after_save :assign_filter
  
  private
  
    def assign_keyword
      if self.keyword.nil?
        create_keyword!(keyword_value: "@"+self.screen_name.to_s)
      else
        self.keyword.keyword_value = "@"+self.screen_name.to_s
        self.keyword.save
      end 
    end
    
    def assign_filter
      if self.filter.nil?
        create_filter!(filter_value: self.user_guid)
      else
        self.filter.filter_value = self.user_guid
        self.filter.save
      end 
    end
    
end
