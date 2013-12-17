class ChangeDefaultToUsers < ActiveRecord::Migration
  def change
  	change_column :users,:user_type, :integer, :default => 1
  end
end
