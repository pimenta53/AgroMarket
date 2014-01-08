class PlamsController < ApplicationController
  before_action :set_plam, only: [:show, :edit, :update, :destroy]

  # GET /plams
  # GET /plams.json
  def index
    @plams = Plam.all
  end

  # GET /plams/1
  # GET /plams/1.json
  def show
  end

  # GET /plams/new
  def new
    @plam = Plam.new
  end

  # GET /plams/1/edit
  def edit
  end

  # POST /plams
  # POST /plams.json
  def create
    @plam = Plam.new(plam_params)

    respond_to do |format|
      if @plam.save
        format.html { redirect_to @plam, notice: 'Plam was successfully created.' }
        format.json { render action: 'show', status: :created, location: @plam }
      else
        format.html { render action: 'new' }
        format.json { render json: @plam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plams/1
  # PATCH/PUT /plams/1.json
  def update
    respond_to do |format|
      if @plam.update(plam_params)
        format.html { redirect_to @plam, notice: 'Plam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @plam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plams/1
  # DELETE /plams/1.json
  def destroy
    @plam.destroy
    respond_to do |format|
      format.html { redirect_to plams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plam
      @plam = Plam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plam_params
      params.require(:plam).permit(:name, :duration, :price, :ads_limit, :event_limit)
    end
end
