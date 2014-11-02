require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get charge_customer" do
    get :charge_customer
    assert_response :success
  end

  test "should get get_balance" do
    get :get_balance
    assert_response :success
  end

end
