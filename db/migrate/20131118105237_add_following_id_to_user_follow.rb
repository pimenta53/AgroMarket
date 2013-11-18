class AddFollowingIdToUserFollow < ActiveRecord::Migration
  def change
    add_reference :user_follows, :following, index: true
  end
end
