class ExcuseController < ApplicationController


  def create_excuse
    current_record = Endurance.where(user_id:current_user.id).order("id desc").first
    current_record.excuses.create(excuse: params[:my_form].to_s)
    current_record.excuses.create(waste_money: params[:money1].to_i * 100)
    @cast = params[:my_form].to_s
    @base = params[:money1] .to_i * 100 
#    @current_excuse = Excuse.where
#    @current_excuse= @current_record.excuse 
#    redirect_to '/show'       
#    render '/show'       
  end
 
#  def show
#    @current_excuse = @current_record.excuse
#  end
end

