class CreateNotificationAds < ActiveRecord::Migration
  def change
    create_table :notification_ads do |t|
      t.integer :user_id,           :null => false
      t.integer :ad_id,             :null => false
      t.boolean :watched,           :default => false
      t.integer :notification_type, :null => false # =>  1 -> message, 2 -> expire date, 3
      t.timestamps
    end
  end
end
