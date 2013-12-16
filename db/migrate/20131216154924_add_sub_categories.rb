class AddSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.string  :name
      t.string  :description
      t.string  :color
      t.integer :category_id
      t.timestamps
    end

  end
end
