# == Schema Information
#
# Table name: admin_publicities
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  description        :string(255)
#  expire_date        :datetime
#  owner              :string(255)
#  is_deleted         :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  link               :string(255)
#

require 'spec_helper'

describe Admin::Publicity do
  pending "add some examples to (or delete) #{__FILE__}"
end
