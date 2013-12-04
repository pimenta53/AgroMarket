# == Schema Information
#
# Table name: academy_workshop_registrations
#
#  id          :integer          not null, primary key
#  workshop_id :integer
#  user_id     :integer
#  is_deleted  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Academy::WorkshopRegistration < ActiveRecord::Base
  belongs_to :workshop
  belongs_to :user
end
