class AddDeletedToEventEvents < ActiveRecord::Migration
  def change
    add_column :event_events, :deleted, :boolean, :default => false
  end
end
