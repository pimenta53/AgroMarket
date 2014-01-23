# == Schema Information
#
# Table name: event_events
#
#  id                 :integer          not null, primary key
#  start_day          :datetime
#  end_day            :datetime
#  title              :string(255)      not null
#  description        :text
#  user_id            :integer
#  aproved            :boolean          default(FALSE)
#  created_at         :datetime
#  updated_at         :datetime
#  city_id            :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  deleted            :boolean          default(FALSE)
#

require 'spec_helper'

describe Event::Event do
  pending "add some examples to (or delete) #{__FILE__}"
end
