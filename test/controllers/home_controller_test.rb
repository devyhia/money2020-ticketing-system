require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get scan" do
    get :scan
    assert_response :success
  end

end
