class CreateCities < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.tables.include?(:cities)
      drop_table :cities
    end

    create_table :cities do |t|
      t.string :city
      t.integer :district_id

      t.timestamps
    end
  end
end
