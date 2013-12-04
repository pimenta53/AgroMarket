# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  rate       :integer
#  rated_id   :integer
#  rater_id   :integer
#  ad_id      :integer
#  comment    :text
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Rating do
  
end
