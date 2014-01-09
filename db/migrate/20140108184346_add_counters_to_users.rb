class AddCountersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :counter_ads,     :integer, :default => 0
    add_column :users, :counter_events,  :integer, :default => 0
  end
end
