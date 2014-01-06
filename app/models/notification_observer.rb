class NotificationObserver < ActiveRecord::Observer
  observe :message


  def after_create( message )
    puts message
  end


end
