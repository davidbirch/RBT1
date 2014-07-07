require 'rubygems'
require 'tweetstream'

ENV["RAILS_ENV"] ||= "development"
root = File.expand_path(File.join(File.dirname(__FILE__), '../..'))
require File.join(root, "config", "environment")

  begin
    twitter_yaml = YAML.load_file(File.expand_path("../../../config/twitter_api.yml", __FILE__))
    twitter_config = twitter_yaml[Rails.env]
    TweetStream.configure do |config|
      config.consumer_key        = twitter_config["api_key"]
      config.consumer_secret     = twitter_config["api_secret"]
      config.oauth_token         = twitter_config["oauth_access_token"]
      config.oauth_token_secret  = twitter_config["oauth_access_token_secret"]
      config.auth_method         = twitter_config["auth_method"]
    end
    
    daemon = TweetStream::Daemon.new('get_tweets',
      :log_output => true,
      :backtrace  => true,
    )
    
    # access the keyword and filter inputs
    keyword_list =   Keyword.all.pluck(:keyword_value)
    filter_list =  Filter.all.pluck(:filter_value)
    ActiveRecord::Base.logger.info "Keyword List: #{keyword_list}"
    ActiveRecord::Base.logger.info "Filter List: #{filter_list}"
    
    daemon.on_inited do
      ActiveRecord::Base.connection.reconnect!
      ActiveRecord::Base.logger = Logger.new(File.expand_path("#{Rails.root}/log/stream.log", __FILE__))     
      ActiveRecord::Base.logger.info "TweetStream Daemon initiated"
    end
    
    daemon.on_error do |message|
      ActiveRecord::Base.logger.info "On_error: #{message}"
    end
    
    daemon.on_reconnect do |timeout, retries|
      ActiveRecord::Base.logger.info "On_reconnect: #{timeout}, #{retries}"
    end
    
    daemon.on_limit do |discarded_count|
      ActiveRecord::Base.logger.info "On_limit: #{discarded_count}"
    end
    
    daemon.filter(:track=>keyword_list, :filter=>filter_list) do |status|
      raw = status.to_json
      tweet_guid = status.id
      raw_tweet = RawTweet.new(:raw=>raw, :tweet_guid=>tweet_guid)
      raw_tweet.save
    end    
    
  rescue Twitter::Error => e
    ActiveRecord::Base.logger.error "message:    #{e.message}"
    ActiveRecord::Base.logger.error "backtrace:  #{e.backtrace.inspect}"
    ActiveRecord::Base.logger.error "code:       #{e.code}"
    ActiveRecord::Base.logger.error "rate limit: #{e.rate_limit.inspect}"
    ActiveRecord::Base.logger.error "exception:  #{e.exception}"
    @error_message = e.message
  
  rescue Exception => e  
    ActiveRecord::Base.logger.error e.message  
    ActiveRecord::Base.logger.error e.backtrace.inspect 
  end
