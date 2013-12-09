class CreateAcademyWorkshopRegistrations < ActiveRecord::Migration
  def change
    create_table :academy_workshop_registrations do |t|
      t.integer :workshop_id, :null => false
      t.integer :user_id,     :null => false
      t.boolean :is_deleted,  :default => false

      t.timestamps
    end
  end
end
