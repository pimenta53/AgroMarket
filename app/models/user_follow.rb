class UserFollow < ActiveRecord::Base
  #composto pelo utilizador dono 'user' e um utilizador a ser seguido 'following' 
  belongs_to :user
  belongs_to :following, class_name: "User", foreign_key: "following_id"
end
