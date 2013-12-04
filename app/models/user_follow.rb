# == Schema Information
#
# Table name: user_follows
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  following_id :integer
#

class UserFollow < ActiveRecord::Base
  #composto pelo utilizador dono 'user' e um utilizador a ser seguido 'following' 
  belongs_to :user
  belongs_to :following, class_name: "User", foreign_key: "following_id"
end
