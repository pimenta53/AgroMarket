# == Schema Information
#
# Table name: academy_workshops
#
#  id                    :integer          not null, primary key
#  user_id               :integer          not null
#  available_slots       :integer          default(0)
#  slots_taken           :integer          default(0)
#  price                 :decimal(10, 2)
#  local                 :string(255)
#  date                  :datetime
#  description           :text
#  is_deleted            :boolean          default(FALSE)
#  requires_registration :integer
#  created_at            :datetime
#  updated_at            :datetime
#  title                 :string(255)
#  is_aproved            :boolean          default(FALSE)
#

require 'spec_helper'

describe Academy::Workshop do
  pending "add some examples to (or delete) #{__FILE__}"
end
