# == Schema Information
#
# Table name: academy_answers
#
#  id          :integer          not null, primary key
#  question_id :integer          not null
#  user_id     :integer          not null
#  up          :integer          default(0)
#  down        :integer          default(0)
#  is_deleted  :boolean          default(FALSE)
#  text        :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Academy::Answer do
  pending "add some examples to (or delete) #{__FILE__}"
end
