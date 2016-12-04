require 'test_helper'

class ExcuseControllerTest < ActionController::TestCase
  
  test "should get create_excuse" do
    sign_in users(:alice)
    get :create_excuse
    assert_response :success
  end

  test 'routing check' do
    assert_generates '/create_excuse', {:controller => 'excuse', :action => 'create_excuse'}
  end
end



