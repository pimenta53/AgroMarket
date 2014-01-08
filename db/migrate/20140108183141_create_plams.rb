class CreatePlams < ActiveRecord::Migration
  def change
    create_table :plams do |t|
      t.string :name,         :null => false
      t.integer :duration,    :default => 6 #6 meses de duracao
      t.float :price,         :null => false
      t.integer :ads_limit,   :null => false
      t.integer :event_limit, :null => false

      t.timestamps
    end
  end
end
