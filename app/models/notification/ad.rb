class Notification::Ad < ActiveRecord::Base
  belongs_to :ads
  belongs_to :users

  def set_type_message
    self.notification_type = 1
  end

  def set_type_expire_date
    self.notification_type = 2
  end

end
