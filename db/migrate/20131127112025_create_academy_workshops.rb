class CreateAcademyWorkshops < ActiveRecord::Migration
  def change
    create_table :academy_workshops do |t|
      t.integer   :user_id,               :null => false
      t.integer   :available_slots
      t.integer   :slots_taken
      t.float     :price
      t.string    :local
      t.datetime  :date
      t.string    :description
      t.boolean   :is_deleted,            :default => false
      t.integer   :requires_registration

      t.timestamps
    end
  end
end
