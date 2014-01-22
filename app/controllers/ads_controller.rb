#encoding: utf-8
class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy , :highlight, :report]
  before_action :load_stuff, only: [:new,:create,:show,:edit,:update, :report]

  load_and_authorize_resource :only => [:edit,:update,:show,:index]
  #load_and_authorize_resource :only => [:edit,:update,:show]

  # GET /ads
  # GET /ads.json
  def index

   # ads = Ad.search_by_location( current_user )
    if params[:page] != nil
      page = params[:page]
    else
      page = 1
    end

      ads = Ad.arel_table

      search_table = ads[:is_deleted].eq(false)

    if params[:search] != nil

      search_table_title = nil
      search_table_description = nil
      search_params = params[:search].split

      search_params.each { |parameter|
        if (search_table_title != nil)
          search_table_title = search_table_title.and(ads[:title].matches("%#{parameter}%"))
          search_table_description  = search_table_description.and(ads[:description].matches("%#{parameter}%"))
        else
          search_table_title = ads[:title].matches("%#{parameter}%")
          search_table_description  = ads[:description].matches("%#{parameter}%")
        end
      }

      search_table = search_table.and(search_table_title.or(search_table_description))
      
      
    end
    @ads = Ad.where(search_table)

    @ads = Ad.search1(params[:cities],params[:search_category],@ads )
    

    @ads = @ads.active_ads.paginate(:page => page, :per_page => 5)

    @categories = Category.all
    @cities = City.order('city ASC').all
    @districts = District.find(:all ,  :order => "name ASC" ,:include => :cities)


    #render :layout => "admin"
    respond_to do |format|
      format.html
      format.json { render json: @ads }
      #format.js {render :layout => false} já não há infinite list em ads
    end
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
    #actualiza o contador de vezes que o ad foi visto
    @ad.increment_page_view

    #devolve produtos parecidos
    @related_ads = @ad.related_ads

    #devolve ultimos ads vistos
    @last_viewed = @ad.last_viewed( session[:history] , @ad.id )

    #poe este anuncio nos anuncios vistos
    store_last_viewed(@ad.id)

    #devolve todos os ratings
    @reviews = Rating.all

    #devolve reviews do dono deste ad
    @reviews_user = @reviews.where("rated_id=?",@ad.user_id)
#mark notification as watched, if params[:notification] is set
    if params.has_key?(:notification) && (Integer(params[:notification]) rescue nil)
      Notification.find(params[:notification]).update(:watched => true)
    end

    if user_signed_in?
      @message = Message.new
      @talks = Talk.all_talk_ad(current_user , @ad)
    end

  end

  # GET /ads/new
  def new

    if current_user.remaining_ads_slots > 0
      @ad = Ad.new
      5.times {@ad.ad_images.build}
    end

  end

  # GET /ads/1/edit
  def edit
  	 (5 - @ad.ad_images.count).times{
    	@ad.ad_images.build
    }
  end

  # POST /ads
  # POST /ads.json
  def create
    #tenta por expire_date para o fim do dia
    begin
    	params[:ad][:expire_date] = DateTime.strptime(params[:ad][:expire_date],'%Y-%m-%d')
    	params[:ad][:expire_date] = params[:ad][:expire_date].change({:hour => 23 , :min => 59 , :sec => 59 })
    rescue
      #põe em nil caso não for válido (ou caso for vazio)
      params[:ad][:expire_date] = nil
    end
    #cria o novo ad, põe o ad com valores iniciais
    @ad = Ad.new(ad_params)
    @ad.user_id = current_user.id
    @ad.is_active = true
    @ad.is_deleted = false

    #http redirection, json render
    respond_to do |format|
      if @ad.save
        User.find(current_user.id).add_ad
        flash[:notice] = "Anúncio criado com sucesso."
        format.html { redirect_to @ad }
        format.json { render action: 'show', status: :created, location: @ad }

        current_user.followers.each do | user|

          feed = Feed.new
          feed.user_id = user.id
          feed.in = 1
          feed.id_content = @ad.id
          feed.save

        end

      else
        flash[:error] = "Erro ao criar anúncio."
        format.html { render action: 'new' }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ads/1
  # PATCH/PUT /ads/1.json
  def update
    begin
    	params[:ad][:expire_date] = DateTime.strptime(params[:ad][:expire_date],'%Y-%m-%d')
    	params[:ad][:expire_date] = params[:ad][:expire_date].change({:hour => 23 , :min => 59 , :sec => 59 })
    rescue
      params[:ad][:expire_date] = nil
    end

    respond_to do |format|
      if @ad.update(ad_params)
        flash[:notice] = "Anúncio atualizado com sucesso."
        format.html { redirect_to @ad }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    #@ad.destroy
    @ad.is_deleted=true
    @ad.is_active=false
    dest = @ad.id
    type = [1,2] #ad_notifications_Code
    Notification.clear_notifications(type,dest)

    @ad.save
    #remove 1 ad from the user counter
    current_user.remove_ad
    respond_to do |format|
      format.html { redirect_to ads_url }
      format.json { head :no_content }
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def report
  
    #reporting code
    
    flash[:notice] = "Anúncio reportado à administração."
    
    respond_to do |format|
      format.html { redirect_to ad_path(@ad) }
      format.json { head :no_content }
    end
  end


  # Mark talk as closed
  # Create rated and rater entry in db
  def done_message
    @ad = Ad.find(params[:id_ad])

    Talk.where("ad_id = ? and ((user_one = ? and user_two = ?) or (user_one = ? and user_two = ?))", @ad.id, @ad.user_id, params[:user_id], params[:user_id], @ad.user_id).update_all(:is_close => 1)
    #@ad.messages.where("receiver_id = ? OR sender_id = ?",params[:user_id],params[:user_id]).update_all(:is_close => 1)

    #set the talk as closed
    @ad.talks.where("(user_one = ? and user_two = ?) or (user_one = ? and user_two = ?)", params[:user_id], current_user.id, current_user.id, params[:user_id]).first.update(:is_close => true)

    # Create new entry, RATED current_user
    Rating.new(:ad_id => @ad.id,:rater_id => params[:user_id],:rated_id => current_user.id).save

    # Create new entry, RATER current_user
    Rating.new(:ad_id => @ad.id,:rater_id => current_user.id ,:rated_id => params[:user_id]).save

    redirect_to ratings_path,notice: 'A mensagem foi terminada com sucesso'
  end

  ## ???  distinguir entre closed e deleted  ????
  ## ???  colocar isto no destroy  ???
  # set the talk as deleted
  def cancel_message
    @ad = Ad.find(params[:id_ad])
    Talk.where("ad_id = ? and ((user_one = ? and user_two = ?) or (user_one = ? and user_two = ?))", @ad.id, @ad.user_id, params[:user_id], params[:user_id], @ad.user_id).update_all(:is_close => 1)
    redirect_to @ad, notice: 'A mensagem foi eliminada com sucesso'

  end

  #para dar destaque ao anuncio
  #coloca-o como destacado
  def highlight
    @ad.highlight = 1

    respond_to do |format|
      if @ad.save
        flash[:notice] = "Anúncio desyacado com sucesso."
        format.html { redirect_to @ad }
        format.json { render action: 'show', status: :created, location: @ad }
      else
        flash[:error] = "Erro ao Destacar anúncio."
        format.html { redirect_to @ad }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(:title, :description, :price, :expire_date, :location,:is_active, :type_price_id, :city_id,:user_id,:category_id, ad_images_attributes: [ :image ])
    end

    # Load cities from database
    def load_stuff
      @cities = City.order('city ASC').all
      @districts = District.find(:all ,  :order => "name ASC" ,:include => :cities)

      @price_types = PriceType.all
      @categories = Category.all

    end

    #store last views ads in session
    def store_last_viewed( ad_id )
      session[:history] ||= []
      session[:history].delete_at(0) if session[:history].size >= 5
      session[:history] << ad_id  unless session[:history].include?( ad_id  )
    end


end
