class CreateCities < ActiveRecord::Migration
  def change
    drop_table :cities

    create_table :cities do |t|
      t.string :city
      t.integer :district_id

      t.timestamps
    end
  end
end
