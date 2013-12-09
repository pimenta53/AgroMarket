class CreateAdImages < ActiveRecord::Migration
  def change
    create_table :ad_images do |t|
      t.integer :ad_id,             :null => false
      t.string  :image_file_name
      t.string  :image_content_type
      t.integer :image_file_size
      t.timestamps
    end
  end
end
