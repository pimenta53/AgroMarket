class AdsCoords < ActiveRecord::Migration
  def change
    add_column :ads, :coordX, :string
    add_column :ads, :coordY, :string
  end
end
