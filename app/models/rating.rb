class Rating < ActiveRecord::Base
	belongs_to :rater,:class_name  => 'User',
                      :primary_key => 'id',
                      :foreign_key => 'rater_id'

  	belongs_to :rated, :class_name => 'User',
                       :primary_key  => 'id',
                       :foreign_key  => 'rated_id'

end
