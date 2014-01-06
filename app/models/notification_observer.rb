class NotificationObserver < ActiveRecord::Observer
  observe :message


  def after_create(record)

  end


end
