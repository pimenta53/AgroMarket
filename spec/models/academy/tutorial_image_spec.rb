# == Schema Information
#
# Table name: academy_tutorial_images
#
#  id          :integer          not null, primary key
#  tutorial_id :integer          not null
#  url         :string(255)
#  is_deleted  :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Academy::TutorialImage do
  pending "add some examples to (or delete) #{__FILE__}"
end
