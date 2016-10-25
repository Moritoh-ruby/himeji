require 'test_helper'
 
class TopControllerTest < ActionController::TestCase
  include Device::Test::ControllerHelpers

  test 'unauthenticated users can GET result' do
    get :result
    assert_success :success
  end

   test 'unauthenticated users can tweet text' do
    tweet_text = "コーヒーを飲んだつもりで100円節約しました。"
    get :result, :kane1 => 1
    assert_equal tweet_text, assigns[:tweet_text]
  end
 
  test 'unauthenticated users can GET result' do
    sign_in users(:alice) 
    get :result
    assert_response :success
  end
  
  test 'check service url' do
    service_url = "https://goo.gl/D6RWc0"  
    get :result
    assert_equal service_url, assigns[:tweet_url]
  end

  test 'check hashtags' do
    hashtags = "%23したつもり貯金 %23どや %23aiit_enpit"   
    get :result
    asset_equal hashtags, assigns[:tweet_hashtags]
  end
end


