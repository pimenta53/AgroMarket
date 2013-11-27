class CreateAcademyTutorialImages < ActiveRecord::Migration
  def change
    create_table :academy_tutorial_images do |t|
      t.integer :tutorial_id
      t.string :url
      t.integer :is_deleted

      t.timestamps
    end
  end
end
