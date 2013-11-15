class Talk < ActiveRecord::Base

  belongs_to :user_one1, :class_name => 'User',
                        :primary_key => 'id',
                        :foreign_key => 'user_one'
  belongs_to :user_two1, :class_name => 'User',
                        :primary_key => 'id',
                        :foreign_key => 'user_two'
  
  has_many :messages, :dependent => :destroy

  #para dar as ultimas mensagens
  has_many :latest_messages, -> { order('created_at desc').limit(5) },
                             class_name: "Message"


  def to_param  # overridden
    "#{id}-istotasuperseguro"
  end


  #validates
  #validate :sender_receiver_must_be_diferent


  #get all talks of a user
  def self.all_talks(user_id)
      where( "(user_one = ? or user_two = ? )",user_id,user_id )
  end

  def user_receiver( current_user )
    if self.user_one == current_user
      return self.user_two
    else
      return self.user_one
    end
  end
  
  private
          #verifica se sender é diferente de receiver
          def sender_receiver_must_be_diferent
                  errors[:base] << "Error message" unless user_one != user_two
          end
end
