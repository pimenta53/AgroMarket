class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.string :description
      t.float :price
      t.datetime :expire_date
      t.string :location
      t.binary :is_active
      t.integer :type_price_id
      t.integer :city_id

      t.timestamps
    end
  end
end
