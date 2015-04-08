require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get generic" do
    get :generic
    assert_response :success
  end

  test "should get elements" do
    get :elements
    assert_response :success
  end

  test "should get forms" do
    get :forms
    assert_response :success
  end

end
