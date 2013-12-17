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

  # buscar os anuncios mais vistos
  def most_viewed( n )
    Ad.most_viewed( n )
  end

  


end