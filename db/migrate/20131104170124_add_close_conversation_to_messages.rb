class AddCloseConversationToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :is_close, :integer
  end
end
