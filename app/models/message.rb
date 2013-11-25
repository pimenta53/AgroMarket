class Message < ActiveRecord::Base


  belongs_to :talk
  belongs_to :user, :class_name => 'User',
                    :foreign_key => 'user_sender'

  #gets all message from a talk
  def self.get_messages( talk )
    where(:talk_id => talk)
  end
end
