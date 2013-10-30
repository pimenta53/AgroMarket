# == Schema Information
#
# Table name: ad_images
#
#  id                 :integer          not null, primary key
#  ad_id              :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#

require 'spec_helper'

describe AdImage do
  pending "add some examples to (or delete) #{__FILE__}"
end
