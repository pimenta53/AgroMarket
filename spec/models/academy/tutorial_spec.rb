# == Schema Information
#
# Table name: academy_tutorials
#
#  id                :integer          not null, primary key
#  category_id       :integer          not null
#  user_id           :integer          not null
#  aproved           :boolean          default(FALSE)
#  title             :string(255)
#  text              :text
#  is_deleted        :boolean          default(FALSE)
#  rapid_description :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

require 'spec_helper'

describe Academy::Tutorial do
  pending "add some examples to (or delete) #{__FILE__}"
end
