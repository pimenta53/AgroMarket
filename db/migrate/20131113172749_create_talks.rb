class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.integer :user_one, :null => false
      t.integer :user_two, :null => false
      t.integer :ad_id
      t.integer :is_close, :default => 0

      t.timestamps
    end
  end
end
