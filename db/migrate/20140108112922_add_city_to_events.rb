class AddCityToEvents < ActiveRecord::Migration
  def change
    add_column :event_events, :city_id, :integer
  end
end
