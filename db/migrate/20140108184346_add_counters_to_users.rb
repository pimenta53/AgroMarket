class AddCountersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :counter_ads,     :integer, :defaulf => 0
    add_column :users, :counter_events,  :integer, :defaulf => 0
  end
end
