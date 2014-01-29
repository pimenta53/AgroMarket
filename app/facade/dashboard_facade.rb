# app/facades/dashboard_facade.rb
class DashboardFacade

  #meter aqui aquilo que irao necesitar no dashboard
  
  #ads por cidade para criar grafico
  def ads_per_city
    Ad.ads_per_city
  end

  def ads_per_district
    Ad.ads_per_district
  end

  def users
    User.all
  end

  def ads_per_category
  	Ad.ads_per_category
  end

  def events_per_user
    User.events_per_user
  end

  def ads_per_user
    User.ads_per_user
  end

  def users_per_district
    User.users_per_district
  end

  def users_last_year
    User.users_per_month_last_year
  end
  
  def most_logged_users
    User.most_logged_users
  end

  # buscar os anuncios mais vistos
  def most_viewed( n )
    Ad.most_viewed( n )
  end

  def closed_talks
    Talk.closed_talks
  end

  def last_ads
    Ad.all.limit(10).reverse!
  end

  def most_viewed_ads
    Ad.most_viewed_this_week
  end

  def last_notifications
    Notification.all.limit(10).reverse!
  end

  def today_ads_count
    Ad.today_ads_count
  end

  def today_users_count
    User.today_users_count
  end

  def today_questions_count
    Academy::Question.today_questions_count
  end

  def today_events_count
    Event::Event.today_events_count
  end

  def today_closed_talks_count
    Talk.today_closed_talks_count
  end

  def today_tutorials_count
    Academy::Tutorial.today_tutorials_count
  end

  def users_per_plan
    Plan.users_per_plan
  end

  def users_per_age_group
    User.users_per_age_group
  end
  


end