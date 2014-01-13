class AddAttachmentImageToEventEvents < ActiveRecord::Migration
  def self.up
    change_table :event_events do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :event_events, :image
  end
end
