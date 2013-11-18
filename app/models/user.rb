# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  username               :string(255)
#  city                   :string(255)
#  birthday               :datetime
#  phone                  :string(255)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  #Dependencies
  has_many :sent_messages,:class_name  => 'Message',
                          :primary_key => 'id',
                          :foreign_key => 'sender_id'
  has_many :received_messages,:class_name  => 'Message',
                              :primary_key => 'id',
                              :foreign_key => 'receiver_id'
  has_many :ads
  has_many :messages 

  has_many :talks_user_one , :class_name => 'Talk',
                             :foreign_key => 'user_one'

  has_many :talks_user_two , :class_name => 'Talk',
                             :foreign_key => 'user_two'

  has_many :user_follows
  has_many :follows_user , :class_name => 'UserFollow',
                           :foreign_key => 'following_id'
  has_many :following, through: :user_follows , :class_name => 'User',
                                                :foreign_key => 'user_id'
  has_many :followers, through: :follows_user , :class_name => 'User',
                                                :source => 'user',
                                                :foreign_key => 'following_id' 

  belongs_to :city

  
  def talks
     talks_user_one + talks_user_two
  end

  #validates
  validates :name, presence: true
  validates :username, :uniqueness => true , presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\Z/i
  
  validate :birthday_cannot_be_in_the_future
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing_photo.png"

  #instance methods
   
  def follow(target)
    link = self.user_follows.where("following_id = ?",target.id).first
    if link == nil
      imperative_follow(target)
    end
    true
  end
   
  def unfollow(target)
    link = self.user_follows.where("following_id = ?",target.id).first
    if link != nil
      link.destroy
    end
    false
  end
  
  def toggle_follow(target)
    link = self.user_follows.where("following_id = ?",target.id).first
    if link != nil
      link.destroy
      false
    else
      imperative_follow(target)
      true
    end
  end
  
  def is_following(target)
    link = self.user_follows.where("following_id = ?",target.id).first
    if link == nil
      false
    else
      true
    end
  end


  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end
  
  def birthday_cannot_be_in_the_future
    if (birthday != nil)
      errors.add(:birthday, " cannot be in the future") if 
        birthday > Date.today
    end
  end


  
  def expired_ads
    self.ads.where("expire_date < ?", Date.today)
  end


  # private methods
  private
  def imperative_follow(target)
    link = UserFollow.create
    link.user = self
    link.following = target
    link.save
  end

end
