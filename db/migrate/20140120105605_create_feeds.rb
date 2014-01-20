class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.references :user, index: true
      t.integer :id_content
      t.integer :in

      t.timestamps
    end
  end
end
