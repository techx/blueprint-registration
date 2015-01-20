require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
  test "should get error" do
    get :error
    assert_response :success
  end

end
