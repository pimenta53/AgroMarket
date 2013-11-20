class Message < ActiveRecord::Base


  belongs_to :talk
  belongs_to :user, :class_name => 'User',
                    :foreign_key => 'user_sender'

    #get talks of ads
  def self.get_messages( talk )
    where(:talk_id => talk)
  end
end
