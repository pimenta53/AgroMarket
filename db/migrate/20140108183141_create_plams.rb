class CreatePlams < ActiveRecord::Migration
  def change
    create_table :plams do |t|
      t.string :name
      t.int :duration
      t.float :price
      t.int :ads_limit
      t.int :event_limit

      t.timestamps
    end
  end
end
