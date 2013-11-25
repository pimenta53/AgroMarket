class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  before_action :load_stuff, only: [:new,:create,:show,:edit,:update]

  # GET /ads
  # GET /ads.json
  def index
    @ads = Ad.search(params[:search])
    @categories = Category.all
    @cities = City.all
    #render :layout => "admin"
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
    #actualiza o contador de vezes que o ad foi visto
    @ad.increment_page_view

    
    if user_signed_in?
      @message = Message.new
      @talk = Talk.all_talk_ad(current_user , @ad)
    end
    
  end

  # GET /ads/new
  def new
    @ad = Ad.new
    5.times {@ad.ad_images.build}
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
    
    #http redirection, json render
    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ad }
      else
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
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
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
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url }
      format.json { head :no_content }
    end
  end

  # Mark talk as closed
  # Create rated and rater entry in db
  def done_message
    @ad = Ad.find(params[:id_ad])

    Talk.where("ad_id = ? and ((user_one = ? and user_two = ?) or (user_one = ? and user_two = ?))", @ad.id, @ad.user_id, params[:user_id], params[:user_id], @ad.user_id).update_all(:is_close => 1)
    #@ad.messages.where("receiver_id = ? OR sender_id = ?",params[:user_id],params[:user_id]).update_all(:is_close => 1)

    # Create new entry, RATED current_user
    rated_current_user = Rating.new(:ad_id => @ad.id,:rater_id => params[:user_id],:rated_id => current_user.id)

    # Create new entry, RATER current_user
    rater_current_user = Rating.new(:ad_id => @ad.id,:rater_id => current_user.id ,:rated_id => params[:user_id])

    rater_current_user.save
    rated_current_user.save

    redirect_to @ad,notice: 'A mensagem foi terminada com sucesso' 
  end

  def cancel_message
    @ad = Ad.find(params[:id_ad])
    Talk.where("ad_id = ? and ((user_one = ? and user_two = ?) or (user_one = ? and user_two = ?))", @ad.id, @ad.user_id, params[:user_id], params[:user_id], @ad.user_id).update_all(:is_close => 1)
    redirect_to @ad, notice: 'A mensagem foi eliminada com sucesso' 
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
      @cities = City.all
      @price_types = PriceType.all 
      @categories = Category.all

    end

end
