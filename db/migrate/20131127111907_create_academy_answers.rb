class CreateAcademyAnswers < ActiveRecord::Migration
  def change
    create_table :academy_answers do |t|
      t.integer :question_id
      t.integer :user_id
      t.integer :up
      t.integer :down
      t.integer :is_deleted
      t.string :image_url
      t.string :text

      t.timestamps
    end
  end
end