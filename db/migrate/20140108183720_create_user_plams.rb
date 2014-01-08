class CreateUserPlams < ActiveRecord::Migration
  def change
    create_table :user_plams do |t|
      t.integer :user_id, :null => false
      t.integer :plam_id, :null => false

      t.timestamps
    end
  end
end
