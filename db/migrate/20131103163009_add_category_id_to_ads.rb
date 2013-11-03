class AddCategoryIdToAds < ActiveRecord::Migration
  def change
    add_column :ads, :category_id, :integer,:null => false
  end
end
