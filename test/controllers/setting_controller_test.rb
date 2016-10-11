require 'test_helper'

class SettingControllerTest < ActionController::TestCase
  test "should get reggoal" do
    get :reggoal
    assert_response :success
  end

end
