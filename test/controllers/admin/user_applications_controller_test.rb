require 'test_helper'

class Admin::UserApplicationsControllerTest < ActionController::TestCase
  setup do
    @admin_user_application = admin_user_applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_user_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_user_application" do
    assert_difference('Admin::UserApplication.count') do
      post :create, admin_user_application: {  }
    end

    assert_redirected_to admin_user_application_path(assigns(:admin_user_application))
  end

  test "should show admin_user_application" do
    get :show, id: @admin_user_application
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_user_application
    assert_response :success
  end

  test "should update admin_user_application" do
    patch :update, id: @admin_user_application, admin_user_application: {  }
    assert_redirected_to admin_user_application_path(assigns(:admin_user_application))
  end

  test "should destroy admin_user_application" do
    assert_difference('Admin::UserApplication.count', -1) do
      delete :destroy, id: @admin_user_application
    end

    assert_redirected_to admin_user_applications_path
  end
end
