class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :keyword_value
      t.integer :user_id

      t.timestamps
    end
  end
end
