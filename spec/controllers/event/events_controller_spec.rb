require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Event::EventsController do

  # This should return the minimal set of attributes required to create a valid
  # Event::Event. As you add validations to Event::Event, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "start_day" => "2013-12-19" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Event::EventsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all event_events as @event_events" do
      event = Event::Event.create! valid_attributes
      get :index, {}, valid_session
      assigns(:event_events).should eq([event])
    end
  end

  describe "GET show" do
    it "assigns the requested event_event as @event_event" do
      event = Event::Event.create! valid_attributes
      get :show, {:id => event.to_param}, valid_session
      assigns(:event_event).should eq(event)
    end
  end

  describe "GET new" do
    it "assigns a new event_event as @event_event" do
      get :new, {}, valid_session
      assigns(:event_event).should be_a_new(Event::Event)
    end
  end

  describe "GET edit" do
    it "assigns the requested event_event as @event_event" do
      event = Event::Event.create! valid_attributes
      get :edit, {:id => event.to_param}, valid_session
      assigns(:event_event).should eq(event)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Event::Event" do
        expect {
          post :create, {:event_event => valid_attributes}, valid_session
        }.to change(Event::Event, :count).by(1)
      end

      it "assigns a newly created event_event as @event_event" do
        post :create, {:event_event => valid_attributes}, valid_session
        assigns(:event_event).should be_a(Event::Event)
        assigns(:event_event).should be_persisted
      end

      it "redirects to the created event_event" do
        post :create, {:event_event => valid_attributes}, valid_session
        response.should redirect_to(Event::Event.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved event_event as @event_event" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event::Event.any_instance.stub(:save).and_return(false)
        post :create, {:event_event => { "start_day" => "invalid value" }}, valid_session
        assigns(:event_event).should be_a_new(Event::Event)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event::Event.any_instance.stub(:save).and_return(false)
        post :create, {:event_event => { "start_day" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested event_event" do
        event = Event::Event.create! valid_attributes
        # Assuming there are no other event_events in the database, this
        # specifies that the Event::Event created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Event::Event.any_instance.should_receive(:update).with({ "start_day" => "2013-12-19" })
        put :update, {:id => event.to_param, :event_event => { "start_day" => "2013-12-19" }}, valid_session
      end

      it "assigns the requested event_event as @event_event" do
        event = Event::Event.create! valid_attributes
        put :update, {:id => event.to_param, :event_event => valid_attributes}, valid_session
        assigns(:event_event).should eq(event)
      end

      it "redirects to the event_event" do
        event = Event::Event.create! valid_attributes
        put :update, {:id => event.to_param, :event_event => valid_attributes}, valid_session
        response.should redirect_to(event)
      end
    end

    describe "with invalid params" do
      it "assigns the event_event as @event_event" do
        event = Event::Event.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Event::Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => event.to_param, :event_event => { "start_day" => "invalid value" }}, valid_session
        assigns(:event_event).should eq(event)
      end

      it "re-renders the 'edit' template" do
        event = Event::Event.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Event::Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => event.to_param, :event_event => { "start_day" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested event_event" do
      event = Event::Event.create! valid_attributes
      expect {
        delete :destroy, {:id => event.to_param}, valid_session
      }.to change(Event::Event, :count).by(-1)
    end

    it "redirects to the event_events list" do
      event = Event::Event.create! valid_attributes
      delete :destroy, {:id => event.to_param}, valid_session
      response.should redirect_to(event_events_url)
    end
  end

end
