# == Schema Information
#
# Table name: plan_users
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  plan_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class PlanUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan



end
