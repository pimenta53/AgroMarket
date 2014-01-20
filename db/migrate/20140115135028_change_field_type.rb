class ChangeFieldType < ActiveRecord::Migration
  def change
    change_column(:plans, :price, :decimal, :precision => 5, :scale => 2, :null => false)
    change_column(:ads, :price, :decimal, :precision => 5, :scale => 2, :null => false)
  end
end
