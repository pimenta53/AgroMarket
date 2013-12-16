# == Schema Information
#
# Table name: ad_images
#
#  id                 :integer          not null, primary key
#  ad_id              :integer          not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  created_at         :datetime
#  updated_at         :datetime
#

require 'spec_helper'


