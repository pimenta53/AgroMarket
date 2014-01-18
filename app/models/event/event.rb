#encoding: utf-8
# == Schema Information
#
# Table name: event_events
#
#  id                 :integer          not null, primary key
#  start_day          :datetime
#  end_day            :datetime
#  title              :string(255)      not null
#  description        :text
#  user_id            :integer
#  aproved            :boolean          default(FALSE)
#  created_at         :datetime
#  updated_at         :datetime
#  city_id            :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  deleted            :boolean
#

class Event::Event < ActiveRecord::Base

	has_attached_file :image,:styles => {
		:avatar => "50x50!",
		:thumb => "100x100!",
		:small  => "300x300!",
		:ad_size => "1200x800!",
		:large => "600x600!"
		},
	 	:default_url => "/assets/defaultAdPic.png"

	belongs_to :city
	belongs_to :user

  validates :start_day, presence: true
  validates :end_day, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validate :end_day_cannot_be_in_the_past
  validate :end_day_cannot_be_before_start_day
  validate :event_limit_validation


  def event_limit_validation
     if User.find(user_id).remaining_events_slots == 0
        errors.add(:title, "Não pode criar novos Eventos!")
     end
  end

	#scope
	default_scope -> { where('deleted = ?',false) } #Só apresenta os eventos que não foram apagados
    default_scope -> { order('created_at DESC') }


	def self.today_events_count
		where('created_at > ?', Date.today).count
	end

	def self.aproved_events
  	  where('aproved = ?',true)
    end

    def self.aproved_undeleted
    	where('aproved = ? AND deleted = ?',true,false)
    end

    def self.unaproved_events
  	  where('aproved= ?',false)
    end

    def is_aproved?
    	self.aproved == true ? true : false
    end

  private
  #a data de fim não pode estar no passado
  def end_day_cannot_be_in_the_past
    if (end_day != nil)
      errors.add(:end_day, " não pode estar no passado") if
        end_day < Date.today
    end
  end

  #a data de fim não pode ocorrer antes da data de inicio
  def end_day_cannot_be_before_start_day
    if (end_day != nil)
      errors.add(:end_day, " não pode ser antes de Start day") if
        end_day < start_day
    end
  end
end
