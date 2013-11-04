class ChangeDefaultValueToMessages < ActiveRecord::Migration
  def change
  	change_column :messages, :is_close, :integer, :default => 0
  end
end
