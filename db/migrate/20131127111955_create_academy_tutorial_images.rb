class CreateAcademyTutorialImages < ActiveRecord::Migration
  def change
    create_table  :academy_tutorial_images do |t|

      t.integer   :tutorial_id, :null => false
      t.string    :url
      t.boolean   :is_deleted, :default => false

      t.timestamps
    end
  end
end
