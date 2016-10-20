class SettingController < ApplicationController
  def reggoal
    @goals = current_user.user_goals.all.order("finish asc")
  end

  def regGoalMoney
    goal1 = current_user.user_goals.build(buttonStr:params[:txtGoal].to_s,goalMoney:params[:money].to_i,finish:true)
    goal1.save

    redirect_to "/"
  end
end
