class AddUserIdAndLinkToAd < ActiveRecord::Migration
  def change
    add_column :ads, :user_id, :integer
    add_column :ads, :permanent_link, :string
  end
end
