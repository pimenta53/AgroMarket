class Academy::Workshop < ActiveRecord::Base
  belongs_to :user
  has_many :workshop_registrations
end
