# == Schema Information
#
# Table name: academy_workshops
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  available_slots       :integer
#  slots_taken           :integer
#  price                 :float
#  local                 :string(255)
#  date                  :datetime
#  description           :string(255)
#  is_delected           :integer
#  requires_registration :integer
#  created_at            :datetime
#  updated_at            :datetime
#

class Academy::Workshop < ActiveRecord::Base
  belongs_to :user
  has_many :workshop_registrations
end
