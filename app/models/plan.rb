# == Schema Information
#
# Table name: plans
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  duration    :integer          default(6)
#  price       :decimal(5, 2)    not null
#  ads_limit   :integer          not null
#  event_limit :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Plan < ActiveRecord::Base
  has_many :plan_users
  has_many :users, :through => :plan_users

def active_plans_count
	self.plan_users.where("created_at >= ?",Date.today - self.duration.month).count
end

def self.users_per_plan
	results = Hash.new
	Plan.all.each do |p|
		results[p.name] = p.users.count
	end
	results.delete('Regular') ## deleted à la trolha
	return results
end

end
