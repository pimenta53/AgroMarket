class AddIsDeletedToAds < ActiveRecord::Migration
  def change
    add_column :ads, :is_deleted, :boolean
  end
end
