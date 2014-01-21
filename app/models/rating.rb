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

class Rating < ActiveRecord::Base
	belongs_to :rater,:class_name  => 'User',
                      :primary_key => 'id',
                      :foreign_key => 'rater_id'

  	belongs_to :rated, :class_name => 'User',
                       :primary_key  => 'id',
                       :foreign_key  => 'rated_id'

	belongs_to :ad
end
