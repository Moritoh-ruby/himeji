class SettingController < ApplicationController
  def reggoal
  end

  def regGoalMoney
    if current_user.user_goals.exists? then
      #goal1 = current_user.user_goals.find_by(user_id: current_user.id.to_i)
      current_user.user_goals.delete_all()
      goal1 = current_user.user_goals.build(buttonStr:params[:txtGoal].to_s,goalMoney:params[:money].to_i)
      goal1.save
    else
      goal1 = current_user.user_goals.build(buttonStr:params[:txtGoal].to_s,goalMoney:params[:money].to_i)
      goal1.save
    end
    redirect_to "/"
  end
end
