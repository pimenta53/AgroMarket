class Academy::Tutorial < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :tutorial_images
end
