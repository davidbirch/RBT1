class AccountLookup
  attr_accessor :screen_name, :name, :user_guid, :profile_background_image_url, :followers_count, :error_message
  
    def initialize(options = {})
        unless options.nil?
          @screen_name ||= options[:screen_name]
          @name ||= options[:name]
          @user_guid = options[:user_guid]
          @profile_background_image_url = options[:profile_background_image_url]
          @followers_count = options[:followers_count]
          @error_message = options[:error_message]
        end        
    end
    
    def update_details_from_twitter
      
      unless @screen_name.empty?
        begin
          client = twitter_api_client
          twitter_user = client.user(@screen_name)
        rescue Twitter::Error => e
          Rails.logger.error "message:    #{e.message}"
          Rails.logger.error "backtrace:  #{e.backtrace.inspect}"
          Rails.logger.error "code:       #{e.code}"
          Rails.logger.error "rate limit: #{e.rate_limit.inspect}"
          Rails.logger.error "exception:  #{e.exception}"
          @error_message = e.message
        rescue Exception => e  
          Rails.logger.error e.message  
          Rails.logger.error e.backtrace.inspect 
        end
        
        if twitter_user.is_a?(Twitter::User)
          @screen_name = twitter_user.screen_name
          @name = twitter_user.name
          @user_guid = twitter_user.id
          @profile_background_image_url = twitter_user.profile_background_image_url
          @followers_count = twitter_user.followers_count
        end
      end
      
      return self
    end 
  
    private
    
      def twitter_api_client
        twitter_yaml = YAML.load_file(File.expand_path("../../../config/twitter_api.yml", __FILE__))
        twitter_config = twitter_yaml[Rails.env]
        Twitter::REST::Client.new do |config|
          config.consumer_key        = twitter_config["api_key"]
          config.consumer_secret     = twitter_config["api_secret"]
          config.access_token        = twitter_config["oauth_access_token"]
          config.access_token_secret = twitter_config["oauth_access_token_secret"]
        end        
      end
  
  
end