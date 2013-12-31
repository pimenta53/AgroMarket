# app/facades/dashboard_facade.rb
class DashboardFacade

  #meter aqui aquilo que irao necesitar no dashboard
  
  #ads por cidade para criar grafico
  def ads_per_city
    Ad.ads_per_city
  end

  def ads_per_category
  	Ad.ads_per_category
  end

  def users_per_district
    User.users_per_district
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


  


end