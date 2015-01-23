require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get mentors" do
    get :mentors
    assert_response :success
  end

  test "should get hackers" do
    get :hackers
    assert_response :success
  end

  test "should get _hacker" do
    get :_hacker
    assert_response :success
  end

  test "should get _mentor" do
    get :_mentor
    assert_response :success
  end

end
