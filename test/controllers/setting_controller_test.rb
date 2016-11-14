require 'test_helper'

class SettingControllerTest < ActionController::TestCase
  #include Devise::Test::ControllerHelpers
  test "should get rgtr_goal" do
    sign_in users(:alice)
    get :rgtr_goal
    assert_response :success
  end

  test 'routing check' do
    assert_generates '/setting', {:controller => 'setting', :action => 'rgtr_goal'}
  end
end
