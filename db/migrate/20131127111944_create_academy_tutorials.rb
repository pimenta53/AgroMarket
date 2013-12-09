class CreateAcademyTutorials < ActiveRecord::Migration
  def change
    create_table :academy_tutorials do |t|

      t.integer :category_id,       :null => false
      t.integer :user_id,           :null => false
      t.boolean :aproved,           :default => false
      t.string  :title
      t.text    :text
      t.boolean :is_deleted,        :default => false
      t.string  :rapid_description

      t.timestamps
    end
  end
end
