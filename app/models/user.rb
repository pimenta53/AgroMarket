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
  has_many :recieved_messages,:class_name  => 'Message',
                              :primary_key => 'id',
                              :foreign_key => 'receiver_id'
  has_many :ads
  belongs_to :city

  #validates
  validates :name, presence: true
  validates :username, :uniqueness => true , presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\Z/i
  
  validate :birthday_cannot_be_in_the_future
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing_photo.png"

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
end
