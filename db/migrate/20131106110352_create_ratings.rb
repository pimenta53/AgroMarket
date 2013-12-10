class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rate
      t.integer :rated_id
      t.integer :rater_id
      t.integer :ad_id
      t.text :comment

      t.timestamps
    end
  end
end
