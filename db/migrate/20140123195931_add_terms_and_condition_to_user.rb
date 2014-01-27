class AddTermsAndConditionToUser < ActiveRecord::Migration
  def change
    add_column :users, :terms_and_conditions, :boolean, :default => 0

    User.update_all(:terms_and_conditions => 1)
  end
end
