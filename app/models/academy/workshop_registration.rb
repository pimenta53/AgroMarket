class Academy::WorkshopRegistration < ActiveRecord::Base
  belongs_to :Workshop
  belongs_to :User
end
