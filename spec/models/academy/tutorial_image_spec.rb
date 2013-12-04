# == Schema Information
#
# Table name: academy_tutorial_images
#
#  id          :integer          not null, primary key
#  tutorial_id :integer
#  url         :string(255)
#  is_deleted  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Academy::TutorialImage do
  pending "add some examples to (or delete) #{__FILE__}"
end
