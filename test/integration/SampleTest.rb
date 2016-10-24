class SampleTest < ActionDispatch::IntegrationTest
  test 'login success' do
    visit 'user_signed_in?'
    fill_in 'メールアドレス' , with: 'email'
    fill_in 'パスワード'  , with: 'password'
    click_button 'ログイン'
    assert_equal '/',page.current_path
  end
end
 
