# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  talk_id     :integer          not null
#  user_sender :integer          not null
#  text        :string(255)
#  is_read     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Message < ActiveRecord::Base


  belongs_to :talk
  belongs_to :user, :class_name => 'User',
                    :foreign_key => 'user_sender'

  #scope

  #gets all message from a talk
  def self.get_messages( talk )
    where(:talk_id => talk)
  end
  
end
