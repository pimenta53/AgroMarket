class Talk < ActiveRecord::Base

  belongs_to :user_one, :class_name => 'User',
                        :primary_key => 'id',
                        :foreign_key => 'user_one'
  belongs_to :user_two, :class_name => 'User',
                        :primary_key => 'id',
                        :foreign_key => 'user_two'
  has_many :messages


  #validates

end
