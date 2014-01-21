class AddAttachmentImageToPublicities < ActiveRecord::Migration
  def self.up
    change_table :publicities do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :publicities, :image
  end
end
