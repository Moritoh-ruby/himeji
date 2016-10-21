class TopController < ApplicationController

  def index
     #サインインしていて、現在のユーザーのuser_idがUserGoalにあった場合の処理
     if user_signed_in? && UserGoal.find_by(:user_id => current_user.id)
     @usergoal = UserGoal.where(user_id:current_user.id).order("id desc").first
     end
     
  end

  def result

     @total_before = params[:kane1].to_i*100

     @tweet_personal_temptation = "コーヒーを飲む"
     @tweet_text_base = "円節約しました。"
     @tweet_login_user_first_time = "これが初めての貯金です！"
     @tweet_login_user_with_history_before = "いままでに"
     @tweet_login_user_with_history_after = "円節約しました！"

     #共通で使うツイート文言　「XXXの代わりにYYY円節約しました！」
     @tweet_text_common = "#{ @tweet_personal_temptation }代わりに#{@total_before}#{ @tweet_text_base }"
     
     if user_signed_in? then
       #DB更新処理
       #TODO 保存先に目標テーブルを追加する
       @total_after = @total_before + current_user.total.to_i
       current_user.total = @total_after.to_s
       current_user.save

       #DB更新処理
       #TODO 目標テーブルの合計金額と比較して、目標金額を超えたばあいにfinishフラグをtrueにする
       if current_user.user_goals.count > 0 && current_user.user_goals.find_by(finish: false) != nil then
         if current_user.total.to_i > current_user.user_goals.find_by(finish: false).goalMoney then
           rec = current_user.user_goals.find_by(finish: false)
           rec.finish = true
           rec.save
         end
       end

       if @total_after == @total_before then
       #合計金額が今回の貯金額と同じなら、初回とみなしてツイート文言作成
         @tweet_text = "#{ @tweet_text_common }#{ @tweet_login_user_first_time }"
       else
       #いままでの合計金額を含めたツイート文言作成
         @tweet_text = "#{ @tweet_text_common }#{ @tweet_login_user_with_history_before }#{ @total_after }#{ @tweet_login_user_with_history_after }"
       end
     #非ログインユーザの場合、最初に作成した共通のツイート文言だけを使う
     else
       @tweet_text = @tweet_text_common
     end
     @tweet_url = "https://goo.gl/D6RWc0"
     @tweet_hashtags = "%23したつもり貯金 %23どや %23aiit_enpit"
  end
  
  def setting
  end

end
