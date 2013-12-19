class CreateEventEvents < ActiveRecord::Migration
  def change
    create_table :event_events do |t|
      t.datetime :start_day
      t.datetime :end_day
      t.string :title    ,:null => false
      t.text :description
      t.integer :user_id
      t.boolean :aproved ,:default => false

      t.timestamps
    end
  end
end
