class AddColumnsToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :payment_type, :integer , :null => false 
    add_column :payments, :ad_id, :integer 
  end
end
