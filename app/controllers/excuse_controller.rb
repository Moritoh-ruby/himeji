class ExcuseController < ApplicationController
 
  
 def create_excuse
   
 @current_record = Endurance.where(user_id:current_user.id).order("id desc").first
 @excuse = @current_record.excuses.create(excuse:params[:endurance_id])
 redirect_to '/show'        
 
   def show
   @excuse= Excuse.find(params[:excuse , :waste_money])  
   end 
 end


end


