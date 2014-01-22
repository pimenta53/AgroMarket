# == Schema Information
#
# Table name: feeds
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  id_content :integer
#  in         :integer
#  created_at :datetime
#  updated_at :datetime
#

class Feed < ActiveRecord::Base
  belongs_to :user
end
