require 'test_helper'

class Admin::PublicitiesControllerTest < ActionController::TestCase
  setup do
    @publicity = publicities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publicities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create publicity" do
    assert_difference('Publicity.count') do
      post :create, publicity: { description: @publicity.description, expire_date: @publicity.expire_date, is_deleted: @publicity.is_deleted, link: @publicity.link, owner: @publicity.owner, title: @publicity.title }
    end

    assert_redirected_to admin_publicity_path(assigns(:publicity))
  end

  test "should show publicity" do
    get :show, id: @publicity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @publicity
    assert_response :success
  end

  test "should update publicity" do
    patch :update, id: @publicity, publicity: { description: @publicity.description, expire_date: @publicity.expire_date, is_deleted: @publicity.is_deleted, link: @publicity.link, owner: @publicity.owner, title: @publicity.title }
    assert_redirected_to admin_publicity_path(assigns(:publicity))
  end

  test "should destroy publicity" do
    assert_difference('Publicity.count', -1) do
      delete :destroy, id: @publicity
    end

    assert_redirected_to admin_publicities_path
  end
end
