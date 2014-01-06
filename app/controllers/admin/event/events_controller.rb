class Admin::Event::EventsController < ApplicationController
  layout "admin"
  before_action :set_event_event, only: [:show, :edit, :update, :destroy]

  # GET /admin/event/events
  # GET /admin/event/events.json
  def index
    @event_events = Event::Event.all
    @aproved_events = Event::Event.aproved_events
    @unaproved_events = Event::Event.unaproved_events
  end

  # GET /admin/event/events/1
  # GET /admin/event/events/1.json
  def show
  end

  # GET /admin/event/events/new
  def new
    @event_event = Event::Event.new
  end

  # GET /admin/event/events/1/edit
  def edit
  end


  def aprove_event
    event = Event::Event.find(params[:id_aprove])
    event.aproved = true
    event.save
    redirect_to admin_event_events_path,:notice => "Evento foi aprovado com sucesso"
  end


  # POST /admin/event/events
  # POST /admin/event/events.json
  def create
    @event_event = Event::Event.new(event_event_params)

    respond_to do |format|
      if @event_event.save
        format.html { redirect_to [:admin, @event_event], notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/event/events/1
  # PATCH/PUT /admin/event/events/1.json
  def update
    respond_to do |format|
      if @event_event.update(event_event_params)
        format.html { redirect_to [:admin, @event_event], notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/event/events/1
  # DELETE /admin/event/events/1.json
  def destroy
    @event_event.destroy
    respond_to do |format|
      format.html { redirect_to admin_event_events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_event
      @event_event = Event::Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_event_params
      params.require(:event_event).permit(:start_day, :end_day, :title, :description, :user_id, :aproved)
    end
end
