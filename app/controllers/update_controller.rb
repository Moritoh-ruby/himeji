class UpdateController < ApplicationController

def edit
  @Usergoal = UserGoals.find_by(user_id: current_user.id,finish: false)
end

def update
  @user_goal = UserGoal.find_by(user_id: current_user.id, finish: false)
end

#private

#  def user_goal_params
#    params.require(:User_goals),permit(:buttonStr, :goalmoney)
#  end
#
end 
