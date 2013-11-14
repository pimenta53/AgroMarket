class Message < ActiveRecord::Base


  belongs_to :talk
  belongs_to :user, :class_name => 'User',
                    :foreign_key => 'user_sender'


end
