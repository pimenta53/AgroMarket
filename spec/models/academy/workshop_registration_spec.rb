# == Schema Information
#
# Table name: academy_workshop_registrations
#
#  id          :integer          not null, primary key
#  workshop_id :integer          not null
#  user_id     :integer          not null
#  is_deleted  :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Academy::WorkshopRegistration do
  pending "add some examples to (or delete) #{__FILE__}"
end
