class CreateNotification < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id,           :null => false
      t.integer :id_destination,    :null => false
      t.boolean :watched,           :default => false
      t.integer :notification_type, :null => false # => 1 -> ad message,
                                                   # => 2 -> ad expired,
                                                   # => 3 -> ad deleted by admin
                                                   # => 4 -> new answer for your questions
                                                   # => 5 -> New registrations to the workshop
                                                   # => 6 ->
                                                   # => 7 ->
      t.text    :description
      t.timestamps
    end
  end
end
