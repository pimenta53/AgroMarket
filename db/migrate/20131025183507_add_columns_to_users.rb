class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :city, :string
    add_column :users, :birthday, :datetime
    add_column :users, :phone, :string
  end
end
