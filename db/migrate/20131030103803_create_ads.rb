class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string    :title
      t.string    :description
      t.float     :price
      t.datetime  :expire_date
      t.string    :location
      t.integer   :type_price_id, :null => false
      t.integer   :city_id,       :null => false
      t.integer   :user_id,       :null => false
      t.string    :permanent_link
      t.integer   :page_views ,   :default => 0
      t.integer   :category_id,   :null => false
      t.boolean   :is_deleted,    :default => false
      t.boolean   :is_active,     :default => false
      t.timestamps
    end
  end
end
