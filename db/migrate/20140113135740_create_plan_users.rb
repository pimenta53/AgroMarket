class CreatePlanUsers < ActiveRecord::Migration
  def change
    create_table :plan_users do |t|
      t.integer :user_id, :null => false
      t.integer :plan_id, :null => false

      t.timestamps
    end
  end
end
