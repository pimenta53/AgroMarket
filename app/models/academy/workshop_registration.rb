# == Schema Information
#
# Table name: academy_workshop_registrations
#
#  id          :integer          not null, primary key
#  workshop_id :integer          not null
#  user_id     :integer          not null
#  is_deleted  :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Academy::WorkshopRegistration < ActiveRecord::Base
  belongs_to :workshop
  belongs_to :user

  validates :user_id, :uniqueness => true
end
