
class UpdateController < ApplicationController
   def update   
     update = Current_user.user_goals.find(user_goals:params[:buttonStr].to_s)
     updategoal = User_goals.update(buttonStr:params[:updategoal].to_s)   
     update = updategoal
     update.save 
　end
 
  def updatemoney　　
 　update1 = Current_user.user_goals.find(user_goals:params[:goalmoney].to_i)
  updatemoney = User_goals.update(goalMoney:params[:updatemoney].to_i) 
 
  if updatemoney > Current_user.total 
  then
  update1 = updatemoney 
  update1.save
  else
   redirect to "/update"
  end
  redirect to "/setting"
  end
end


