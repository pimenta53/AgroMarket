# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  talk_id     :integer          not null
#  user_sender :integer          not null
#  text        :string(255)
#  is_read     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'
