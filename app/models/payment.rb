# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  ref        :string(255)      not null
#  user_id    :integer          not null
#  used       :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

class Payment < ActiveRecord::Base

  has_many :users

end
