class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :talk_id, :null => false
      t.integer :user_sender, :null => false
      t.string :text
      t.integer :is_read, :defaulf => 0

      t.timestamps
    end
  end
end
