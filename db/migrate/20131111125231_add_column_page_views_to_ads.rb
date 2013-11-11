class AddColumnPageViewsToAds < ActiveRecord::Migration
  def change
    add_column :ads, :page_views, :integer ,:default => 0
  end
end
