class AddPaperclipToAdImage < ActiveRecord::Migration
  def change
    add_column :ad_images, :image_file_name, :string
    add_column :ad_images, :image_content_type, :string
    add_column :ad_images, :image_file_size, :integer
  end
end
