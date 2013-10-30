# == Schema Information
#
# Table name: price_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class PriceType < ActiveRecord::Base
end
