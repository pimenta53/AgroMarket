class AddAttachmentImageToAdminPublicities < ActiveRecord::Migration
  def self.up
    change_table :admin_publicities do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :admin_publicities, :image
  end
end
