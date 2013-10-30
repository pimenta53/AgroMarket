class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :text
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :ad_id
      t.binary :is_read

      t.timestamps
    end
  end
end
