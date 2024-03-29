#encoding: utf-8
class Academy::WorkshopsController < ApplicationController
  before_action :set_academy_workshop, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :only => [:edit,:update,:show,:index]

  # GET /academy/workshops
  # GET /academy/workshops.json
  def index
    @academy_workshops = Academy::Workshop.aproved_workshops
    @categories = Category.all
  end

  # GET /academy/workshops/1
  # GET /academy/workshops/1.json
  def show
    @academy_workshop_registrations = @academy_workshop.workshop_registrations


    @academy_workshop_registration = Academy::WorkshopRegistration.new
    if user_signed_in?
      @academy_registed = Academy::WorkshopRegistration.where(:workshop_id => @academy_workshop.id , :user_id => current_user.id).first
    end
  end

  # GET /academy/workshops/new
  def new
    @academy_workshop = Academy::Workshop.new
    @categories = Category.all
  end

  # GET /academy/workshops/1/edit
  def edit

  end

  # POST /academy/workshops
  # POST /academy/workshops.json
  def create
    @categories = Category.all
    @academy_workshop = Academy::Workshop.new(academy_workshop_params)
    @academy_workshop.user_id = current_user.id
    @academy_workshop.slots_taken = 0

    respond_to do |format|
      if @academy_workshop.save
        flash[:notice] = "Workshop criado com sucesso."
        format.html { redirect_to @academy_workshop, notice: 'Workshop criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @academy_workshop }
      else
        format.html { render action: 'new' }
        format.json { render json: @academy_workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academy/workshops/1
  # PATCH/PUT /academy/workshops/1.json
  def update
    respond_to do |format|
      if @academy_workshop.update(academy_workshop_params)
        flash[:notice] = "Workshop actualizado com sucesso."
        format.html { redirect_to @academy_workshop, notice: 'Workshop actualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @academy_workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academy/workshops/1
  # DELETE /academy/workshops/1.json
  def destroy
    #@academy_workshop.destroy
    flash[:notice] = "Workshop destruido com sucesso."
    @academy_workshop.is_deleted=true
    dest = @academy_workshop.id
    Notification.clear_notifications(8,dest) #Aproved_workshop_Code
    Notification.clear_notifications(5,dest) #new_registration_in_your_workshop_code
    @academy_workshop.save
    respond_to do |format|
      format.html { redirect_to academy_workshops_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academy_workshop
      @academy_workshop = Academy::Workshop.find(params[:id])
      @categories = Category.all

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academy_workshop_params
      params.require(:academy_workshop).permit(:user_id, :available_slots, :price, :local, :date, :description, :requires_registration,:title)
    end
end
