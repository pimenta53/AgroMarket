# == Schema Information
#
# Table name: academy_answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  user_id     :integer
#  up          :integer
#  down        :integer
#  is_deleted  :integer
#  image_url   :string(255)
#  text        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Academy::Answer do
  pending "add some examples to (or delete) #{__FILE__}"
end
