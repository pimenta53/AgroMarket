class CreateAcademyWorkshopRegistrations < ActiveRecord::Migration
  def change
    create_table :academy_workshop_registrations do |t|
      t.integer :workshop_id
      t.integer :user_id
      t.integer :is_deleted

      t.timestamps
    end
  end
end
