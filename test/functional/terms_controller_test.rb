require 'test_helper'

class TermsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get read" do
    get :read
    assert_response :success
  end

  test "should get new_version" do
    get :new_version
    assert_response :success
  end

  test "should get new_version_form" do
    get :new_version_form
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

end
