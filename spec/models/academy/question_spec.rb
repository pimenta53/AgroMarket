# == Schema Information
#
# Table name: academy_questions
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  category_id :integer          not null
#  title       :string(255)      not null
#  text        :text
#  is_deleted  :boolean          default(FALSE)
#  image_url   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Academy::Question do
  pending "add some examples to (or delete) #{__FILE__}"
end
