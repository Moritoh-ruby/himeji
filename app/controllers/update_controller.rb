class UpdateController < ApplicationController

def edit
  @user_goal = UserGoal.find_by(user_id: current_user.id,finish: false)
end

def update
  @user_goal = UserGoal.find_by(user_id: current_user.id,finish: false)
  @user_goal.buttonStr = params[:buttonStr].to_s 
  @user_goal.goalMoney = params[:goalmoney].to_i
  @user_goal.save
    redirect_to '/setting'

  
end

#private

#  def user_goal_params
#    params.require(:User_goals),permit(:buttonStr, :goalmoney)
#  end
#

end
