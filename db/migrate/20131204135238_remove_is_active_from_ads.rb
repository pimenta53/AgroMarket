class RemoveIsActiveFromAds < ActiveRecord::Migration
  def change
    remove_column :ads, :is_active, :binary
  end
end
