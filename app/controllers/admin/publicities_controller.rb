class Admin::PublicitiesController < Admin::ApplicationController
  before_action :set_admin_publicity, only: [:show, :edit, :update, :destroy]

  # GET /admin/publicities
  # GET /admin/publicities.json
  def index
    @admin_publicities = Admin::Publicity.all
  end

  # GET /admin/publicities/1
  # GET /admin/publicities/1.json
  def show
  end

  # GET /admin/publicities/new
  def new
    @admin_publicity = Admin::Publicity.new
  end

  # GET /admin/publicities/1/edit
  def edit
  end

  # POST /admin/publicities
  # POST /admin/publicities.json
  def create
    @admin_publicity = Admin::Publicity.new(admin_publicity_params)

    respond_to do |format|
      if @admin_publicity.save
        format.html { redirect_to @admin_publicity, notice: 'Publicity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_publicity }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_publicity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/publicities/1
  # PATCH/PUT /admin/publicities/1.json
  def update
    respond_to do |format|
      if @admin_publicity.update(admin_publicity_params)
        format.html { redirect_to @admin_publicity, notice: 'Publicity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_publicity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/publicities/1
  # DELETE /admin/publicities/1.json
  def destroy
    @admin_publicity.destroy
    respond_to do |format|
      format.html { redirect_to admin_publicities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_publicity
      @admin_publicity = Admin::Publicity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_publicity_params
      params.require(:admin_publicity).permit(:title, :description, :link, :expire_date, :owner, :is_deleted, :image)
    end
end
