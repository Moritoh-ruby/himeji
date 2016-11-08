class UpdateController < ApplicationController

def edit
  @user_goal = UserGoal.find_by(user_id: current_user.id,finish: false)
end

def update
  @user_goal = UserGoal.find_by(user_id: current_user.id,finish: false)
  @user_goal.buttonStr = params[:user_goal][:buttonStr].to_s
  @user_goal.goalMoney = (params[:goalMoney].to_i) * 1000
  
if  @user_goal.goalMoney > params[:total].to_i/1000 then 
    @user_goal.save
    redirect_to '/setting'     
  else    
   render '/edit'
end   
   
end
#private

#  def user_goal_params
#    params.require(:User_goals),permit(:buttonStr, :goalmoney)
#  end
#

end
