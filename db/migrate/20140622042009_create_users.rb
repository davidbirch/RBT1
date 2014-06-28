class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :screen_name
      t.column :user_guid, :bigint # manually changed from int to bigint
      t.integer :followers_count
      t.string :profile_background_image_url

      t.timestamps
    end
  end
end
