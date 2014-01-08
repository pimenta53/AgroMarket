#encoding: utf-8
class Academy::WorkshopsController < ApplicationController
  before_action :set_academy_workshop, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :only => [:edit,:update,:show,:index]

  # GET /academy/workshops
  # GET /academy/workshops.json
  def index
    @academy_workshops = Academy::Workshop.all
    @categories = Category.all
  end

  # GET /academy/workshops/1
  # GET /academy/workshops/1.json
  def show
    @academy_workshop_registrations = @academy_workshop.workshop_registrations
    @academy_workshop_registration = Academy::WorkshopRegistration.new


    #mark notification as watched, if params[:notification] is set
    if params.has_key?(:notification) && (Integer(params[:notification]) rescue nil)
      Notification.find(params[:notification]).update(:watched => true)
    end

  end

  # GET /academy/workshops/new
  def new
    @academy_workshop = Academy::Workshop.new
  end

  # GET /academy/workshops/1/edit
  def edit
  end

  # POST /academy/workshops
  # POST /academy/workshops.json
  def create
    @academy_workshop = Academy::Workshop.new(academy_workshop_params)
    @academy_workshop.user_id = current_user.id
    @academy_workshop.slots_taken = 0

    respond_to do |format|
      if @academy_workshop.save
        format.html { redirect_to @academy_workshop, notice: 'Workshop was successfully created.' }
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
        format.html { redirect_to @academy_workshop, notice: 'Workshop was successfully updated.' }
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
    @academy_workshop.destroy
    respond_to do |format|
      format.html { redirect_to academy_workshops_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academy_workshop
      @academy_workshop = Academy::Workshop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academy_workshop_params
      params.require(:academy_workshop).permit(:user_id, :available_slots, :price, :local, :date, :description, :requires_registration)
    end
end
