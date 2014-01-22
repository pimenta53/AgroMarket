#encoding: utf-8
# == Schema Information
#
# Table name: academy_workshops
#
#  id                    :integer          not null, primary key
#  user_id               :integer          not null
#  available_slots       :integer          default(0)
#  slots_taken           :integer          default(0)
#  price                 :decimal(10, 2)
#  local                 :string(255)
#  date                  :datetime
#  description           :text
#  is_deleted            :boolean          default(FALSE)
#  requires_registration :integer
#  created_at            :datetime
#  updated_at            :datetime
#  title                 :string(255)
#  is_aproved            :boolean          default(FALSE)
#

class Academy::Workshop < ActiveRecord::Base
  belongs_to :user
  has_many :workshop_registrations

  #scope
  default_scope -> { where('is_deleted = ?',false) } #Só apresenta os workshops que não foram apagados

  ## validations ##
  validates :description, :length => {:maximum => 255, too_long: "é demasiado longo!", :minimum => 50, too_short: "tem de ser composto no mínimo por 50 caracteres."}, :presence => "true"
  validates :available_slots, presence: true

  def add_inscription
    self.slots_taken += 1
    self.save
  end

  def remove_inscription
    self.slots_taken -= 1
    self.save
  end

  def has_available_slots?
  	self.slots_taken < available_slots ? true : false
  end

  def requires_registration?
  	self.requires_registration == 1 ? true : false
  end

  def self.aproved_workshops
    where('is_aproved = ?',true)
  end

  def self.unaproved_workshops
    where('is_aproved = ?',false)
  end
end
