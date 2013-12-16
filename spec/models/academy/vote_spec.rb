# == Schema Information
#
# Table name: academy_votes
#
#  id         :integer          not null, primary key
#  vote       :integer
#  user_id    :integer          not null
#  answer_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Academy::Vote do
  pending "add some examples to (or delete) #{__FILE__}"
end
