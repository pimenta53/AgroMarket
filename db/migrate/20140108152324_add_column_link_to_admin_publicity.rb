class AddColumnLinkToAdminPublicity < ActiveRecord::Migration
  def change
    add_column :admin_publicities, :link, :string
  end
end
