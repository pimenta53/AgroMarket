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
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  name                   :string(255)
#  birthday               :datetime
#  phone                  :string(255)
#  city_id                :integer
#  ocupation              :string(255)
#  user_type              :integer          default(1)
#  created_at             :datetime
#  updated_at             :datetime
#  counter_ads            :integer          default(0)
#  counter_events         :integer          default(0)
#  plan_id                :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  #omniauth
  has_many :omni_authentications, :class_name  => 'Authentication',
                                  :primary_key => 'id',
                                  :foreign_key => 'user_id',
                                  :dependent => :destroy

  #Dependencies
  has_many :sent_messages,:class_name  => 'Message',
                          :primary_key => 'id',
                          :foreign_key => 'sender_id'
  has_many :received_messages,:class_name  => 'Message',
                              :primary_key => 'id',
                              :foreign_key => 'receiver_id'
  has_many :ads
  has_many :events
  has_many :messages

  has_many :talks_user_one , :class_name => 'Talk',
                             :foreign_key => 'user_one'

  has_many :talks_user_two , :class_name => 'Talk',
                             :foreign_key => 'user_two'

  has_many :user_follows
  has_many :follows_user , :class_name => 'UserFollow',
                           :foreign_key => 'following_id'

  #permite buscar os utilizadores que 'self' está a seguir
  has_many :following, through: :user_follows , :class_name => 'User',
                                                :foreign_key => 'user_id'
  #permite buscar os utilizadores a seguirem 'self'
  has_many :followers, through: :follows_user , :class_name => 'User',
                                                :source => 'user',
                                                :foreign_key => 'following_id'


  has_many :notifications

  belongs_to :plan , :foreign_key => 'plan_id'

  #belongs_to :district
  belongs_to :city

  belongs_to :payment

  has_many :plan_users
  has_many :plans, :through => :plan_users

  has_one :workshop_registration

  has_many :events, :class_name => Event::Event , :foreign_key => 'user_id'

  def talks
     talks_user_one + talks_user_two
  end

  #validates
  validates :name, presence: true
  validates :phone, format: /(^$|(\d{9,}\Z))/i
  validates :email, presence: true,format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\Z/i
  validates :city, presence: true
  validate :birthday_cannot_be_in_the_future



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :small => "50x50>" , :tiny =>"25x25!"}, :default_url => "/assets/missing_photo.png"

  #validates :avatar, :attachment_presence => true
  #validates_with AttachmentPresenceValidator, :attributes => :avatar
  #validates_attachment :avatar, :presence => true,
  #:content_type => { :content_type => "image/jpg" },
  #:size => { :in => 0..10.kilobytes }

  #instance methods

  #verifica se utilizador é admin
  def isAdmin?
    if !self.blank?
      return self.user_type == 2
    end
  end

#devolve o maximo de anuncios que pode ter em simultaneo
  def max_ads
    self.plans.sum(:ads_limit)
  end

#devolve o maximo de eventos que pode ter em simultaneo
  def max_events
    self.plans.sum(:event_limit)
  end

#devolve o numero de anuncios que o utilizador tem ativos
  def active_ads_count
    self.ads.where("expire_date >= ?", Date.today).where(:is_deleted => false, :is_active => true).count
  end

#devolve o numero de evento que o utilizador tem ativos
  def active_events_count
    self.events.where("end_day >= ?", Date.today).where(:deleted => false).count
  end

#conta o numero slots para anuncios que o utilizador tem restantes
  def remaining_ads_slots
    #num de anuncios dos pacotes  - num de anuncios que possui ativos
    self.max_ads - self.active_ads_count
  end

#conta o numero slots para eventos que o utilizador tem restantes
  def remaining_events_slots
    #num de eventos dos pacotes  - num de eventos que possui
    self.max_events - self.active_events_count
  end

  def add_ad
    self.counter_ads += 1
    self.save
  end

  def remove_ad
    self.counter_ads -= 1
    self.save
  end

  def add_event
    self.counter_events += 1
    self.save
  end

  def remove_event
    self.counter_events -= 1
    self.save
  end

  #fica a seguir 'target'
  #target.class = user
  def follow(target)
    link = self.user_follows.where("following_id = ?",target.id).first
    if link == nil
      imperative_follow(target)
    end
    true
  end

  #pára de seguir 'target'
  #target.class = user
  def unfollow(target)
    link = self.user_follows.where("following_id = ?",target.id).first
    if link != nil
      link.destroy
    end
    false
  end

  #muda o estado de follow com o 'target', para de seguir se estiver a seguir ou o contrário
  #target.class = user
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

  #se o utilizador está a seguir 'target'
  #target.class = user
  def is_following(target)
    link = self.user_follows.where("following_id = ?",target.id).first
    if link == nil
      false
    else
      true
    end
  end

  #todos conversas do utilizador
  def all_talks
    Talk.all_talks(id)
  end

  def private_talks
    Talk.private_talks(self.id)
  end

  def ads_talks
    Talk.ads_talks(self.id)
  end


  #idade do utilizador
  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  #a data do nascimento não pode estar no futuro
  def birthday_cannot_be_in_the_future
    if (birthday != nil)
      errors.add(:birthday, " cannot be in the future") if
        birthday > Date.today
    end
  end

  #busca todos os ads fora da validade do utilizador
  def expired_ads
    self.ads.where("expire_date < ?", Date.today)
  end

  def generate_password
    #password_length = 6
    #password = Devise.friendly_token.first(password_length)
    #self.password=password
    #self.password_confirmation=password

    self.password='1234567890'
    self.password_confirmation='1234567890'
  end

  #inserir dados pelo omniauth
  def apply_omniauth(omniauth)
    self.generate_password
    if omniauth['provider'] == 'facebook'


      #Buscar info
      self.email = omniauth['info']['email']
      self.name = omniauth['info']['name']


      #location é composto por "Cidade, Pais"
      if omniauth['info']['location'] != nil
        location = omniauth['info']['location'].split(", ")
      else
        location = ''
      end
      #location = omniauth['info']['location'].split(", ")

      #buscar cidade do location

      city = City.find_by city: location[0]
      if city != nil
      	self.city = city
      end


      #buscar imagem
      #if omniauth['info']['image']!=nil
      #  self.avatar = URI.parse(omniauth['info']['image'])
      #end

      omni_authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
    elsif omniauth['provider'] == 'twitter'
      #Buscar info
      self.name = omniauth['info']['name']

      #buscar cidade do location
      city = City.find_by city: omniauth['info']['location']
      if city != nil
      	self.city = city
      end

      #buscar imagem
      #if omniauth['info']['image']!=nil
      #  self.avatar = URI.parse(omniauth['info']['image'])
      #end

      omni_authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
    elsif omniauth['provider'] == 'google_oauth2'
      #Buscar info
      self.email = omniauth['info']['email']
      self.name = omniauth['info']['name']

      #Google não contem cidade

      omni_authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
    end
  end

  def has_provider(provider)
    collection = omni_authentications.where("provider = ?",provider)
    collection.length > 0
  end

  def self.match_omniauth(omniauth)
    email = nil
    user = nil
    if omniauth['provider'] == 'facebook'
      email = omniauth['info']['email']
    elsif omniauth['provider'] == 'twitter'
      email = nil
    else
      email = omniauth['info']['email']
    end

    if email != nil
      user = User.where("email = ?",email).first
    end
    user
  end

  def password_required?
    (omni_authentications.empty? || !password.blank?) && super
  end

  #######################
  ### STATISTIC ZONE ####
  #######################

  #users last month
  def self.last_month
    find(:all, :conditions =>["created_at > ?", 1.month.ago])
  end

  def self.last_week
    find(:all, :conditions =>["created_at > ?", 1.week.ago])
  end

  #users count by district
  def self.users_per_district
    results = Hash.new
    District.find(:all).each do |d|
      results[d.name]=d.users.count
    end
    return results
  end

  # users registered today
  def self.today_users_count
    where('created_at > ?', Date.today).count
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
