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
  has_many :ads, :foreign_key  => 'type_price_id'

  validates :name, presence: true, :uniqueness => true
end
