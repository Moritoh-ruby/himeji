class ExcuseController < ApplicationController


  def create_excuse
    excuse = params[:excuse].to_s
    excuse = "(言い訳なし)" if excuse.blank?
    current_record = Endurance.where(user_id:current_user.id).order("id desc").first
    if current_record then
      @new_excuse = current_record.excuses.create(excuse: excuse, waste_money: params[:waste_money].to_i * 100)
      @current_endurance = current_record.endurance
    else
      render action: :excuse_error
    end
  end
end

