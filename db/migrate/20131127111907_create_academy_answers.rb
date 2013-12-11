class CreateAcademyAnswers < ActiveRecord::Migration
  def change
    create_table :academy_answers do |t|
      t.integer :question_id, :null => false
      t.integer :user_id,     :null => false
      t.integer :up,          :default => 0
      t.integer :down,        :default => 0
      t.boolean :is_deleted,  :default => false
      t.text    :text

      t.timestamps
    end
  end
end
