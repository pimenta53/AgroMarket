class Message < ActiveRecord::Base


  belongs_to :talk
  belongs_to :user


end
