class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.string :text
      t.integer :is_deleted

      t.timestamps
    end
  end
end
