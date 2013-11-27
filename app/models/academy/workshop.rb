class Academy::Workshop < ActiveRecord::Base
  belongs_to :User
  has_many :Workshop_registrations
end
