# == Schema Information
#
# Table name: academy_tutorials
#
#  id          :integer          not null, primary key
#  category_id :integer
#  user_id     :integer
#  aproved     :integer
#  title       :string(255)
#  text        :text
#  is_delected :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Academy::Tutorial do
  pending "add some examples to (or delete) #{__FILE__}"
end
