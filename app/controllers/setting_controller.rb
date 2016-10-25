class SettingController < ApplicationController
  def reggoal
    @goals = current_user.user_goals.all.order("finish asc")
  end

  def regGoalMoney
    goal1 = current_user.user_goals.build(buttonStr:params[:txtGoal].to_s,goalMoney:params[:money].to_i,finish:false, total:0)
    goal1.save
    current_user.total = 0
    current_user.save
    redirect_to "/setting"
  end
end
