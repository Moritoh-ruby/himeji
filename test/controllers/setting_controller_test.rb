require 'test_helper'

class SettingControllerTest < ActionController::TestCase
  #include Devise::Test::ControllerHelpers
  test "should get reggoal" do
    sign_in users(:alice)
    get :reggoal
    assert_response :success
  end

end
