class CreatePlams < ActiveRecord::Migration
  def change
    create_table :plams do |t|
      t.string :name,     :null => false
      t.int :duration,    :default => 6 #6 meses de duracao
      t.float :price,     :null => false
      t.int :ads_limit,   :null => false
      t.int :event_limit, :null => false

      t.timestamps
    end
  end
end
