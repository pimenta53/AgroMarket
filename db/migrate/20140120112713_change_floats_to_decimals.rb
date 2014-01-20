class ChangeFloatsToDecimals < ActiveRecord::Migration
  def change
    change_column :academy_workshops, :price, :decimal, :precision => 10, :scale => 2
  end
end
