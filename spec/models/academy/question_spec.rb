# == Schema Information
#
# Table name: academy_questions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category_id :integer
#  title       :string(255)
#  text        :string(255)
#  is_deleted  :integer
#  image_url   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Academy::Question do
  pending "add some examples to (or delete) #{__FILE__}"
end
