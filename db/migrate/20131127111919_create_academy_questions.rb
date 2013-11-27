class CreateAcademyQuestions < ActiveRecord::Migration
  def change
    create_table :academy_questions do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.string :text
      t.integer :is_deleted
      t.string :image_url

      t.timestamps
    end
  end
end
