class TopController < ApplicationController

  def index
     #サインインしていて、現在のユーザーのuser_idがUserGoalにあった場合の処理
     if user_signed_in? && UserGoal.find_by(:user_id => current_user.id)
       @usergoal = UserGoal.where(user_id:current_user.id).order("id desc").first
       @usergoal_button_text = @usergoal.buttonStr
     else
       @usergoal_button_text = "好きなこと"
     end
 
     if user_signed_in? &&  current_user.endurances.exists?
       @current_record = Endurance.where(user_id:current_user.id).order("id desc").first
       @endurance_button_text = @current_record.endurance
     else
       @endurance_button_text = "コーヒーを飲む"
     end
     #トップページは別レイアウト
     render :layout => 'indexapp'
  end

  def result

     @total_before = params[:money1].to_i*100
     if  user_signed_in? &&  current_user.endurances.exists?
     @current_record = Endurance.where(user_id:current_user.id).order("id desc").first
     @tweet_personal_temptation = @current_record.endurance
     else
     @tweet_personal_temptation = "コーヒーを飲む"
     @tweet_alternative_action = "節約します。"
     end

     if user_signed_in? then
       #DB更新処理
       @total_after = @total_before + current_user.total.to_i
       current_user.total = @total_after.to_s
       current_user.save

       #目標テーブルがあれば最新の目標金額に加算（この時点でfinishフラグは考えない）
       if current_user.user_goals.count > 0 then
           rec = current_user.user_goals.last
           rec.total = rec.total + @total_before

       #目標テーブルが金額を超えていたらfinish=trueにする
         if rec.finish == false && rec.total >= rec.goalMoney then
              rec.finish = true

         end
         rec.save

         #目標の文言を取得する
	 @tweet_alternative_action = rec.buttonStr + "に使います。"
         @tweet_remaining_money = rec.goalMoney - rec.total
         @tweet_goal_money_text = rec.finish ? "目標の" + rec.goalMoney.to_s + "円を達成しました！" : "目標金額まであと" + @tweet_remaining_money.to_s + "円です！"
       else
       #目標テーブルがない場合、合計金額だけをみて文言作成
         if @total_after == @total_before then
       #合計金額が今回の貯金額と同じなら、初回とみなしてツイート文言作成
           @tweet_goal_money_text = "これが初めての貯金です！"
         else
       #いままでの合計金額を含めたツイート文言作成
         @tweet_goal_money_text = "いままでに" + current_user.total + "円貯金しました！"
         end
       end

     end

     #「XXXのかわりに、YYY円をZZZに使います。」
     @tweet_text = "#{ @tweet_personal_temptation }かわりに、#{@total_before}円を#{ @tweet_alternative_action }#{ @tweet_goal_money_text }"
     @tweet_url = "https://goo.gl/D6RWc0"
     @tweet_hashtags = "%23したつもり貯金 %23どや %23aiit_enpit"
  end
  
  def setting
  end

end
