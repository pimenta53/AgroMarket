class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :ref,      :null => false
      t.integer :user_id, :null => false
      t.boolean :used,    :default => false

      t.timestamps
    end
  end
end
