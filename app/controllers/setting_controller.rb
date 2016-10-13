class SettingController < ApplicationController
  def reggoal
  end
  def regGoalMoney
    goal1 = current_user.user_goals.build(buttonStr:params[:txtGoal].to_s,goalMoney:params[:money].to_i)
    goal1.save
    redirect_to action: :reggoal
  end
end
