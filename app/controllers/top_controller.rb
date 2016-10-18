class TopController < ApplicationController

  def index
  end
  def result
     # Tweetに使う変数たち 
     @hash_symbol = "%23"
     @tweet_text_base = "円節約しました。"
     @tweet_personal_temptation = "コーヒーを飲む"
     @tweet_login_user_first_time = "これが初めての貯金です！"
     @tweet_login_user_with_history_before = "いままでに"
     @tweet_login_user_with_history_after = "円貯金しました！"

     @total_before = params[:kane1].to_i*100
     # Tweetの基本文言作成
　　 @tweet_text_common = "instead-of-coffee"

     #if user_signed_in? then
     #  # DB更新
     #  @total_after = @total_before + current_user.total.to_i
     #  current_user.total = @total_after.to_s
     #  current_user.save
     # 
     #  if @total_before == @total_after then
     #    # はじめての貯金〜の文言を作成
　　 # ��   @tweet_text = @tweet_text_common + @tweet_login_user_first_time
     #  else
     #    # いままでにXX円〜の文言を作成
　　 # ��   @tweet_text = "#{@tweet_text_common}#{@tweet_login_user_with_history_before}#{@total_after}#{@tweet_login_user_with_history_after}"
     #  end
     #else
       # 未ログインユーザ向けの文言を作成
　　　 @tweet_text = "#{@tweet_text_common}"
     #end
     
     # Tweetの共通部分作成
     @tweet_url = "https://goo.gl/D6RWc0"
     @tweet_hashtags = "#{@hash_symbol}どや #{@hash_symbol}したつもり貯金 #{@hash_symbol}aiit_enpit"
  end
  
  def setting
  end

end
