class AddIsActiveToAds < ActiveRecord::Migration
  def change
    add_column :ads, :is_active, :boolean
  end
end
