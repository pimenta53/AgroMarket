# == Schema Information
#
# Table name: plans
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  duration    :integer          default(6)
#  price       :float            not null
#  ads_limit   :integer          not null
#  event_limit :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Plan < ActiveRecord::Base
  has_many :plan_users
  has_many :users, :through => :plan_users
end
