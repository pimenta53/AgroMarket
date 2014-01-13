# == Schema Information
#
# Table name: notifications
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  id_destination    :integer          not null
#  watched           :boolean          default(FALSE)
#  notification_type :integer          not null
#  description       :text
#  created_at        :datetime
#  updated_at        :datetime
#

class Notification < ActiveRecord::Base

  belongs_to :user
  
  def self.ads_notification
    where(:notification_type => ["1", "2", "3"])
  end

  def self.academy_notification
    where(:notification_type => ["4", "5"])
  end

  #notificações de eventos e tutoriais aprovados
  def self.aproved_academy_notifications
    where(:notification_type => ["6", "7"])
  end

  #verify if a user has new notification
  def self.new_notification?( current_user )
    r = where(:user_id => current_user, :watched => false)
    return r.blank? ? false : true
  end

  def self.create_notification( current_user , id_destination , notification_type , description )
      n = Notification.new(:user_id => current_user.id, :id_destination => id_destination, :notification_type => notification_type, :description => description )
      n.save
  end
  
  #get Ad of notification
  def ad
    Ad.find(self.id_destination)
  end

  def question
    Academy::Question.find(self.id_destination)
  end

  def workshop
    Academy::Workshop.find(self.id_destination)
  end

  def event
    Event::Event.find(self.id_destination)
  end

  def type_notification
    if self.notification_type == 6
      Academy::Tutorial.find(self.id_destination)
    elsif self.notification_type == 7
      Event::Event.find(self.id_destination)
    end
  end

  def set_type(type)
    self.notification_type = case type
        when :ad_message
          1
        when :ad_expired
          2
        when :ad_deleted_by_admin
          3
        when :new_answer
          4
      end
  end

  def is_type?(type)
    self.notification_type == case type
        when :ad_message
          1
        when :ad_expired
          2
        when :ad_deleted_by_admin
          3
        when :new_answer
          4
      end
  end



end
