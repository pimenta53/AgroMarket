class AddCityIdAndRemoveCityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city_id, :integer
    remove_column :users, :city
  end
end
