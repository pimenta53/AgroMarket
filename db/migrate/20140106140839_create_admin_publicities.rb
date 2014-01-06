class CreateAdminPublicities < ActiveRecord::Migration
  def change
    create_table :admin_publicities do |t|
      t.string :title
      t.string :description
      t.datetime :expire_date
      t.string :owner
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
