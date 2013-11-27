class Academy::Tutorial < ActiveRecord::Base
  belongs_to :User
  belongs_to :categary
  has_many :Tutorial_images
end
