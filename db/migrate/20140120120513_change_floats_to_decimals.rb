class ChangeFloatsToDecimals < ActiveRecord::Migration
  def change
    change_column :academy_workshops, :price, :decimal, :precision => 10, :scale => 2
    change_column :ads,               :price, :decimal, :precision => 10, :scale => 2
  end
end
