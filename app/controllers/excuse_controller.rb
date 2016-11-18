class ExcuseController < ApplicationController
 
  
 def create_excuse
   
 @current_record = Endurance.where(user_id:current_user.id).order("id desc").first
 excuse = @current_record.excuses.create(excuse:params[:excuse].to_s)
 redirect_to '/show'       

 
   def show
    
   end 
 end


end


