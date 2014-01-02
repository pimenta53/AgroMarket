class Notification::Ad < ActiveRecord::Base
  belongs_to :ads
  belongs_to :users
end
