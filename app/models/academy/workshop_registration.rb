class Academy::WorkshopRegistration < ActiveRecord::Base
  belongs_to :workshop
  belongs_to :user
end
