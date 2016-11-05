require 'test_helper'

class TopControllerTest < ActionController::TestCase
  

  test 'unauthenticated users can GET result' do
    get :result
    assert_response :success
  end

  test 'unauthenticated users tweet text' do
    tweet_text = "コーヒーを飲むかわりに、100円を節約します。"
    get :result, :kane1 => 1
    assert_equal tweet_text, assigns[:tweet_text]
  end

  test 'authenticated users can GET result' do
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
    assert_equal hashtags, assigns[:tweet_hashtags]
  end

  test 'tweet w/o goal and first time' do
    sign_in users(:chris)
    tweet_text = "コーヒーを飲むかわりに、100円を節約します。これが初めての貯金です！"
    get :result, :kane1 => 1
    assert_equal tweet_text, assigns[:tweet_text]
  end

  test 'tweet w/o goal but not first time' do
    sign_in users(:dean)
    tweet_text = "コーヒーを飲むかわりに、100円を節約します。いままでに1100円貯金しました！"
    get :result, :kane1 => 1
    assert_equal tweet_text, assigns[:tweet_text]
  end

  test 'tweet w/ unfinished goal will be the goal itself and remaining amount' do
    sign_in users(:alice)
    tweet_text = "コーヒーを飲むかわりに、100円を沖縄旅行に使います。目標金額まであと400円です！"
    get :result, :kane1 => 1
    assert_equal tweet_text, assigns[:tweet_text]
  end

  test 'tweet w/ finished goal only will be the goal and finished statement' do
    sign_in users(:bob)
    tweet_text = "コーヒーを飲むかわりに、100円をニートになるために使います。目標の1000円を達成しました！"
    get :result, :kane1 => 1
    assert_equal tweet_text, assigns[:tweet_text]
  end

  test 'tweet w/ goal just finished will be the goal and finished statement' do
    sign_in users(:alice)
    tweet_text = "コーヒーを飲むかわりに、600円を沖縄旅行に使います。目標の1000円を達成しました！"
    get :result, :kane1 => 6
    assert_equal tweet_text, assigns[:tweet_text]
  end

  test "unauthenticated users can GET index" do
    get :index
    assert_response :success
  end
 
  test "authenticated users can GET index" do
    sign_in users(:alice)
    get :index  
    assert_response :success     
  end

end


