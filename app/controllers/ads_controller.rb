class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  before_action :load_cities, only: [:new,:create,:show,:edit,:update]

  # GET /ads
  # GET /ads.json
  def index
    @ads = Ad.all
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
    @message = Message.new
    hashMessage = {}
    @ad.messages.each do |m|
      if m.sender_id != @ad.user_id
        if !hashMessage.has_key?(m.sender_id)
          hashMessage[m.sender_id] = []
        end

        hashMessage[m.sender_id].push(m)
      else
        # Esta clausula esta aqui pork é uma resposta tenho que a colocar no sítio certo
        hashMessage[m.receiver_id].push(m)
      end
    end
    @messageToView = hashMessage
    
  end

  # GET /ads/new
  def new
    @ad = Ad.new
    5.times {@ad.ad_images.build}
  end

  # GET /ads/1/edit
  def edit
    5.times {@ad.ad_images.build}
  end

  # POST /ads
  # POST /ads.json
  def create
    @ad = Ad.new(ad_params)
    @ad.user_id = current_user.id
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

private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.includes([:messages]).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(:title, :description, :price, :expire_date, :location,:is_active, :type_price_id, :city_id,:user_id, ad_images_attributes: [ :image ])
    end

    # Load cities from database
    def load_cities
      @cities = City.all
    end
end
