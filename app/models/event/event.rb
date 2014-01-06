# == Schema Information
#
# Table name: event_events
#
#  id          :integer          not null, primary key
#  start_day   :datetime
#  end_day     :datetime
#  title       :string(255)      not null
#  description :text
#  user_id     :integer
#  aproved     :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Event::Event < ActiveRecord::Base



	def self.today_events_count
		where('created_at > ?', Date.today).count	
	end

	def self.aproved_events
		where('aproved = ?', true)
	end

	def self.unaproved_events
		where('aproved = ?', false)
	end

end
