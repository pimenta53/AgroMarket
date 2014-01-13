# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  ref        :string(255)      not null
#  user_id    :integer          not null
#  used       :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Payment do
  pending "add some examples to (or delete) #{__FILE__}"
end
