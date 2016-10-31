class UpdateController < ApplicationController
   def update
     UserGoal.find_by(:user_id => current_user.id)
     @usergoal = current_user.id(buttonStr:params[:updateGoal].to_s ,goalMoney:params[:updatemoney].to_i)
     respond_to do |format|
    if @userGoal.update((buttonStr:params[:updateGoal]to_s, goalMoney:updatemoney)
      format.html { redirect_to @usergoal, notice: '変更できました' } 
    else
     format.html { render action: '変更できません' } 
  end

end    



