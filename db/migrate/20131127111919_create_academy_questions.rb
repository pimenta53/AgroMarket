class CreateAcademyQuestions < ActiveRecord::Migration
  def change
    create_table  :academy_questions do |t|
      t.integer   :user_id,     :null => false
      t.integer   :category_id, :null => false
      t.string    :title,       :null => false
      t.text      :text
      t.boolean   :is_deleted,  :default => false
      t.timestamps
    end
  end
end
