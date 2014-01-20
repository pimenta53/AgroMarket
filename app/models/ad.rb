#encoding: utf-8
# == Schema Information
#
# Table name: ads
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  description    :string(255)
#  price          :float
#  expire_date    :datetime
#  location       :string(255)
#  type_price_id  :integer          not null
#  city_id        :integer          not null
#  user_id        :integer          not null
#  permanent_link :string(255)
#  page_views     :integer          default(0)
#  category_id    :integer          not null
#  is_deleted     :boolean          default(FALSE)
#  is_active      :boolean          default(FALSE)
#  created_at     :datetime
#  updated_at     :datetime
#  highlight      :integer          default(0)
#

class Ad < ActiveRecord::Base
  # associations
  belongs_to :city
  belongs_to :user
  belongs_to :category
  belongs_to :price_type, :foreign_key  => 'type_price_id'

  has_many :ad_images, :dependent => :destroy
  has_many :messages
  has_many :talks


  #scopes
  default_scope -> { where('is_deleted = ?',false) } #Só apresenta os anúncios que não foram apagados


  # atributes
  accepts_nested_attributes_for :ad_images

  #filters
  before_validation :create_permalink, :calculate_expire_date


  #validates
  validates :title, presence: true
  validates :price, presence: true, format: /\d{1,}\Z/i
  validates :type_price_id, presence: true
  validates :city_id, presence: true
  validates :category, presence: true
  validate :ad_limit_validation, on: :create


  def ad_limit_validation
     if User.find(user_id).remaining_ads_slots == 0
        errors.add(:title, I18n.t('activerecord.errors.ad.limit_reached'))
     end
  end

     # class methods

     def self.separateQuery(params)
      categories = Array.new
      cities = Array.new
      $i = 0
      begin
         if params[$i][1] == "a"
          categories.push(Integer(params[$i].gsub(/[^[:digit:]]/, '')))
         else
          if params[$i][1] == "i"
             cities.push(Integer(params[$i].gsub(/[^[:digit:]]/, '')))
          end
         end
         $i +=1
      end while $i < params.length
      [categories,cities]
     end

     def self.search(params)
        active_ads = where(is_active: true) #busca só os anúncios activos
      if params
         result = self.separateQuery(params) #separa as categorias e as cidades
         categories = result[0]
         cities = result[1]


         if categories.length>0 && cities.length>0 #caso se filtre por categoria e cidade (interseccao)
          filtered_categories = active_ads.where(category_id: categories)
          filtered_categories.where(city_id: cities)

         else
          if categories.length>0 #caso so se filtre por categorias
             active_ads.where(category_id: categories)
          else
             if cities.length>0 #caso so se filtre por cidade
              active_ads.where(city_id: cities)
             else
              active_ads
             end
          end
         end
      else
         active_ads  #não foi feita nenhuma pesquisa -> retorna todosos anúncios activos
      end
     end


     #####################
     # PREFERENCE SEARCH #
     #####################
     #so para teste enquanto não ha preferencias nos Utilizadores
     @preferences_category_id = [1, 2]
     @preferences_keyword = ["Batatas", "Doces"]
     @preferences_location = ["Braga", "Porto"]


     def self.search_by_preference( current_user )
        #pesquisa por categoria
        ads = search_by_category

        #pesquisa por palavra-chave
        #ads = ads.search_by_keyword

        #pesquisa por localização
        #ads = ads.search_by_location

        #isto devolve os anuncios todos filtrados por preferencias do utilizador
        return ads
     end

     #pesquisa por categoria
     def self.search_by_category
        where(:category_id => @preferences_category_id)
     end

     #pesquisa por palavra chave
     def self.search_by_keyword
        #ads = where(:category_id => @preferences)
     end

     #pesquisa por localizacao
     def self.search_by_location ( current_user )
        ads = where(:city_id => current_user.city_id)

        if ads.length <= 10
          ads << where(:city_id => [ current_user.city.district.cities.map{ |c| c.id } ] )
        end
     end


     ####################
     # instance methods #
     ####################
     def to_param
      "#{id}-#{permanent_link}"
     end

     def increment_page_view
      self.page_views = self.page_views + 1
      self.save
     end

     def limited_description(limit)
      if (self.description.length > limit)
         if limit < 4 || self.description.length < 3
          "..."
         else
          self.description.first(limit-3) + "..."
         end
      else
         self.description
      end
     end


  #devolve anuncios relacionados por categoria
  def related_ads
     Ad.where(:category_id => self.category_id).where.not(id: self.id).limit(4)
  end


  #delvolve ultimos ads vistos por utilizador
  def last_viewed( history , current_ad)
     view_ads = []
     if !history.nil?
        history.each do |ad_id|
          # verifica se anuncio que estamos a ver esta no historico
          if current_ad != ad_id
             ad = Ad.find_by_id(ad_id)
             view_ads << ad unless ad == nil
          end

        end
     end

     return view_ads
  end

  def first_image
  if !self.ad_images.blank?
     return self.ad_images.first.image
  else
     return "http://placehold.it/40x30"
  end

  end

  def highlight
    self.highlight = 1
    calculate_expire_date
  end
  #######################
  ### STATISTIC ZONE ####
  #######################

     def self.ads_per_city
        #, :includes => ads
        result = Array.new
        City.find(:all).each do |c|
         result.push([ c.city , c.ads.count ])
        end
        return result
     end

     def self.most_viewed_this_week
        where("created_at > ?", 1.week.ago).order('page_views').limit(10)
     end

     def self.most_viewed( n )
        order(:page_views).limit( n )
     end

     def self.ads_per_category
        results = Array.new
        Category.find(:all ).each do |c|
         results.push([ c.name , c.ads.count ])
        end
        return results
     end

     def self.today_ads_count
     where("created_at > ?", Date.today).count
     end

     def self.ads_highlight
        results = Array.new
        ids = Array.new
        i = 0
        myArray = where("highlight = ? and is_active = ?",1,1)
        c = myArray.size
        while i < 5 && c > 0
          x = myArray.find(:first, :offset =>rand(c))
          ids.push(x.id)
          results.push(x)
          myArray =  where("id not in (?) and highlight = ? and is_active = ?",ids,1,1)
          i = i+1
          c = myArray.size
        end
        return results
     end


    def self.active_ads
      where("is_active = ?",true)
    end

  # private methods
  private
    #para criar friendly Url
    def create_permalink
      self.permanent_link = "#{self.title.parameterize}"
    end

     def calculate_expire_date
        self.expire_date = Time.now + 2.week
     end

     #erro se a expire_date for no passado
    def expire_date_cannot_be_in_the_past
      errors.add(:expire_date, I18n.t('activerecord.errors.generic.cannot_be_in_past')) if
      !expire_date.blank? and expire_date < Date.today
    end

        #erro se expire_date exceder 7 dias a partir de hoje
    def expire_date_cannot_exceed_limit 
      errors.add(:expire_date, I18n.t('activerecord.errors.generic.cannot_exceed_one_week')) if
      !expire_date.blank? and (expire_date.change({:hour => 0 , :min => 0 , :sec => 0 }) - 1.week) > Date.today
    end


end
