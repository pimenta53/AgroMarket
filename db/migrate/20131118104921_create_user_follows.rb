class CreateUserFollows < ActiveRecord::Migration
  def change
    create_table :user_follows do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end
