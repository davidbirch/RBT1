class CreateRawTweets < ActiveRecord::Migration
  def change
    create_table :raw_tweets do |t|
      t.text :raw
      t.column :tweet_guid, :bigint # manually changed from int to bigint

      t.timestamps
    end
  end
end
