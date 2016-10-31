class SettingController < ApplicationController
  def reggoal
    @goals = current_user.user_goals.all.order("finish asc")
  end

  def regGoalMoney
    realMoney = params[:money].to_i * 1000
    goal1 = current_user.user_goals.build(buttonStr:params[:txtGoal].to_s, goalMoney:realMoney, finish:false, total:0)
    goal1.save
    redirect_to "/setting"
  end
end
