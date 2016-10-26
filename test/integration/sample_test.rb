require "test_helper"


class SampleTest < ActionDispatch::IntegrationTest

  test 'login success' do
    https!  
    get"/result"
    assert_response :success
  end
end
 
