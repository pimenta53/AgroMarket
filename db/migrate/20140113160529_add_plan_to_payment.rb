class AddPlanToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :plan_id, :integer, :null => false
  end
end
