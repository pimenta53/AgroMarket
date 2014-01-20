# == Schema Information
#
# Table name: talks
#
#  id         :integer          not null, primary key
#  user_one   :integer          not null
#  user_two   :integer          not null
#  ad_id      :integer
#  is_close   :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#

class Talk < ActiveRecord::Base

  #uma Conversa pertence a dois utilizadores primarios
  belongs_to :user_1, :class_name => 'User',
                        :primary_key => 'id',
                        :foreign_key => 'user_one'
  belongs_to :user_2, :class_name => 'User',
                        :primary_key => 'id',
                        :foreign_key => 'user_two'

  has_many :messages, :dependent => :destroy

  #para dar as ultimas mensagens
  has_many :latest_messages, -> { order('created_at ASC').limit(5) },
                             class_name: "Message"

  #validates
  validate :sender_receiver_must_be_diferent

  #scope
  default_scope -> { order('created_at DESC') }

  def to_param  # overridden
    "#{id}-istotasuperseguro"
  end

  #get all talks of a user
  def self.all_talks(user_id)
      includes(:messages).where( "(user_one = ? or user_two = ? )",user_id,user_id )
  end

  def self.private_talks(user_id)
    includes(:messages).where( "(user_one = ? or user_two = ? ) and ad_id is NULL ",user_id,user_id )
  end

  def self.ads_talks(user_id)
    includes(:messages).where( "(user_one = ? or user_two = ? ) and ad_id IS NOT NULL ",user_id,user_id )
  end

  #INSTANCE METHODS

  #get talks of MP
  def self.talk_mp( current_user , user_two)
    where("((user_one = ? and user_two = ?) or (user_one = ? and user_two = ?)) and ad_id is NULL ", current_user.id, user_two.id, user_two.id, current_user.id).first
  end

  #get talks of ads
  def self.talk_ad( current_user , ad)
    where("((user_one = ? and user_two = ?) or (user_one = ? and user_two = ?)) and ad_id = ?", current_user.id, ad.user_id, ad.user_id, current_user.id, ad.id).first
  end

  #get all unclosed talks of ads from the current_user
  def self.all_talk_ad( current_user , ad)
    where("(user_one = ? or user_two = ?) and ad_id = ? and is_close != 1", current_user.id, current_user.id, ad.id)
  end



  def self.closed_talks
    where("is_close = ? ",1)
  end

  def self.today_closed_talks_count
    where("is_close = ? and updated_at > ?",1,Date.today).count
  end


  # verifica para quem vai mandar a mensagem
  # verifica quem é o receiver
  def user_receiver( current_user )
    if self.user_one == current_user
      return self.user_two
    else
      return self.user_one
    end
  end

  def user_receiver_name( current_user )
    if self.user_one == current_user
      return User.find(self.user_two).name
    else
      return User.find(self.user_one).name
    end
  end

  def user_receiver_email( current_user )
    if self.user_one == current_user
      return User.find(self.user_two).email
    else
      return User.find(self.user_one).email
    end
  end


  private
          #verifica se sender é diferente de receiver
          def sender_receiver_must_be_diferent
                  errors[:base] << "Error message" unless user_one != user_two
          end
end
