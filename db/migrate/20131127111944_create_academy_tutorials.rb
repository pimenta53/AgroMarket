class CreateAcademyTutorials < ActiveRecord::Migration
  def change
    create_table :academy_tutorials do |t|
      t.integer :category_id
      t.integer :user_id
      t.integer :aproved
      t.string :title
      t.string :text
      t.integer :is_delected

      t.timestamps
    end
  end
end
