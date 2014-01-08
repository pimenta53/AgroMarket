#encoding: utf-8
class Admin::CitiesController < ApplicationController
  layout "admin"
  before_action :set_admin_city, only: [:show, :edit, :update, :destroy]

  # GET /admin/cities
  # GET /admin/cities.json
  def index
    @cities = City.all
    @citiesAZ = City.alphabetically
  end

  # GET /admin/cities/1
  # GET /admin/cities/1.json
  def show
  end

  # GET /admin/cities/new
  def new
    @city = City.new
    @district = District.all
  end

  # GET /admin/cities/1/edit
  def edit
    @district = District.all
  end

  # POST /admin/cities
  # POST /admin/cities.json
  def create
    @city = City.new(admin_city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to [:admin,@city], notice: 'City was successfully created.' }
        format.json { render action: 'show', status: :created, location: @city }
      else
        format.html { render action: 'new' }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/cities/1
  # PATCH/PUT /admin/cities/1.json
  def update
    respond_to do |format|
      if @city.update(admin_city_params)
        format.html { redirect_to [:admin,@city], notice: 'City was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/cities/1
  # DELETE /admin/cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to admin_cities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_city_params
      params.require(:city).permit(:city, :district_id)
    end
end
