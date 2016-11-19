class ExcuseController < ApplicationController
 
 def list
 @excuses = Excuse.all 
 end
 
  def create_excuse
 
 @current_record = Endurance.where(user_id:current_user.id).order("id desc").first
 excuse = @current_record.excuses.create(excuse: params[:excuse].to_s)
 
 redirect_to '/show'       
 
  def show
 @excuse = Excuse.find(params[:endurances_id])
 @my_excuse   = params[:excuse][:excuse].to_s
 @waste_money = params[:waste_money].to_i
    
  end 
 end
end



