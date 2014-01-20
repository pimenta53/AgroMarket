#encoding: utf-8
class Academy::WorkshopRegistrationsController < ApplicationController
  before_action :set_academy_workshop_registration, only: [:show, :edit, :update, :destroy]
  #load_and_authorize_resource


  # GET /academy/workshop_registrations
  # GET /academy/workshop_registrations.json
  def index
    @academy_workshop_registrations = Academy::WorkshopRegistration.all
  end

  # GET /academy/workshop_registrations/1
  # GET /academy/workshop_registrations/1.json
  def show
  end

  # GET /academy/workshop_registrations/new
  def new
    @academy_workshop_registration = Academy::WorkshopRegistration.new
  end

  # GET /academy/workshop_registrations/1/edit
  def edit
  end

  # POST /academy/workshop_registrations
  # POST /academy/workshop_registrations.json
  def create
    @academy_workshop_registration = Academy::WorkshopRegistration.new(academy_workshop_registration_params)
    respond_to do |format|
      if @academy_workshop_registration.save

        workshop = @academy_workshop_registration.workshop
        workshop.add_inscription

        #notify the owner of the Workshop
        Notification.create_notification( workshop.user_id , workshop.id , 5 , "Tem uma Nova Inscrição")

        format.html { redirect_to  @academy_workshop_registration.workshop, notice: 'Workshop registration was successfully created.' }
        format.json { render action: 'show', status: :created, location: @academy_workshop_registration }
      else
        format.html { redirect_to  @academy_workshop_registration.workshop, notice: 'Já se encontra registado no Workshop.' }
        format.json { render json: @academy_workshop_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academy/workshop_registrations/1
  # PATCH/PUT /academy/workshop_registrations/1.json
  def update
    respond_to do |format|
      if @academy_workshop_registration.update(academy_workshop_registration_params)
        format.html { redirect_to @academy_workshop_registration, notice: 'Workshop registration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @academy_workshop_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academy/workshop_registrations/1
  # DELETE /academy/workshop_registrations/1.json
  def destroy


    workshop = @academy_workshop_registration.workshop_id
    @academy_workshop_registration.destroy
    Academy::Workshop.find(workshop).remove_inscription

    respond_to do |format|
      format.html { redirect_to academy_workshop_path(workshop) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academy_workshop_registration
      @academy_workshop_registration = Academy::WorkshopRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academy_workshop_registration_params
      params.require(:academy_workshop_registration).permit(:workshop_id, :user_id, :is_deleted)
    end
end
