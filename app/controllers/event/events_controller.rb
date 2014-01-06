class Event::EventsController < ApplicationController
  before_action :set_event_event, only: [:show, :edit, :update, :destroy]

  # GET /event/events
  # GET /event/events.json
  def index
    if params[:page] != nil
      page = params[:page]
    else
      page = 1
    end
    @event_events = Event::Event.aproved_events.paginate(:page => page, :per_page => 8)
  end

  # GET /event/events/1
  # GET /event/events/1.json
  def show
  end

  # GET /event/events/new
  def new
    @event_event = Event::Event.new
  end

  # GET /event/events/1/edit
  def edit
  end

  # POST /event/events
  # POST /event/events.json
  def create
    @event_event = Event::Event.new(event_event_params)
    @event_event.user_id = current_user.id
    
    respond_to do |format|
      if @event_event.save
        format.html { redirect_to @event_event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event/events/1
  # PATCH/PUT /event/events/1.json
  def update
    respond_to do |format|
      if @event_event.update(event_event_params)
        format.html { redirect_to @event_event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event/events/1
  # DELETE /event/events/1.json
  def destroy
    @event_event.destroy
    respond_to do |format|
      format.html { redirect_to event_events_url }
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
