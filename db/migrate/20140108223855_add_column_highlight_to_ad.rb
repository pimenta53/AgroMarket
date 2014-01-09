class AddColumnHighlightToAd < ActiveRecord::Migration
  def change
    add_column :ads, :highlight, :integer , :default => 0
  end
end
