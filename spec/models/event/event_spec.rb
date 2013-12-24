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

require 'spec_helper'

describe Event::Event do
  pending "add some examples to (or delete) #{__FILE__}"
end
