require 'test_helper'

class Admin::Event::EventsControllerTest < ActionController::TestCase
  setup do
    @event_event = event_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_event" do
    assert_difference('Event::Event.count') do
      post :create, event_event: { aproved: @event_event.aproved, description: @event_event.description, end_day: @event_event.end_day, start_day: @event_event.start_day, title: @event_event.title, user_id: @event_event.user_id }
    end

    assert_redirected_to admin_event_event_path(assigns(:event_event))
  end

  test "should show event_event" do
    get :show, id: @event_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_event
    assert_response :success
  end

  test "should update event_event" do
    patch :update, id: @event_event, event_event: { aproved: @event_event.aproved, description: @event_event.description, end_day: @event_event.end_day, start_day: @event_event.start_day, title: @event_event.title, user_id: @event_event.user_id }
    assert_redirected_to admin_event_event_path(assigns(:event_event))
  end

  test "should destroy event_event" do
    assert_difference('Event::Event.count', -1) do
      delete :destroy, id: @event_event
    end

    assert_redirected_to admin_event_events_path
  end
end
