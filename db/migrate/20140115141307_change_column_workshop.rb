class ChangeColumnWorkshop < ActiveRecord::Migration
  def change
    change_column :academy_workshops, :available_slots, :integer, :default=>0
    change_column :academy_workshops, :slots_taken, :integer, :default=>0
  end
end
