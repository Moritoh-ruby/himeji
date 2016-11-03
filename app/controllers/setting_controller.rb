class SettingController < ApplicationController
  def reggoal
    @goals = current_user.user_goals.all.order("finish asc")
    if user_signed_in? &&  current_user.endurances.exists?
    @current_record = Endurance.where(user_id:current_user.id).order("id desc").first
    @current_endurance = @current_record.endurance
    @curent_endurance_text = "現在の設定："+ @current_endurance
    end
  end

  def regGoalMoney
    realMoney = params[:money].to_i * 1000
    goal1 = current_user.user_goals.build(buttonStr:params[:txtGoal].to_s, goalMoney:realMoney, total:0)
    goal1.save
    redirect_to "/setting"
  end
  
  def create_endurance
    endurance = current_user.endurances.create(endurance:params[:endurance].to_s)
    redirect_to "/setting"
  end
end
