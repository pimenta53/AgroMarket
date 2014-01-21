class CreatePublicities < ActiveRecord::Migration
  def change
    create_table :publicities do |t|
      t.string :title
      t.string :description
      t.datetime :expire_date
      t.string :owner
      t.string :link
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
