# == Schema Information
#
# Table name: academy_workshops
#
#  id                    :integer          not null, primary key
#  user_id               :integer          not null
#  available_slots       :integer
#  slots_taken           :integer
#  price                 :float
#  local                 :string(255)
#  date                  :datetime
#  description           :string(255)
#  is_deleted            :boolean          default(FALSE)
#  requires_registration :integer
#  created_at            :datetime
#  updated_at            :datetime
#

class Academy::Workshop < ActiveRecord::Base
  belongs_to :user
  has_many :workshop_registrations

  def add_inscription
  	self.slots_taken += 1
  	self.save
  end
  
  def has_available_slots?
  	self.slots_taken < available_slots ? true : false
  end

  def requires_registration?
  	self.requires_registration == 1 ? true : false

  end
end
