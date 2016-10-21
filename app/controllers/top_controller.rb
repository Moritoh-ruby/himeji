class TopController < ApplicationController

  def index
  end

  def result
     @total_before = params[:kane1].to_i*100
  if user_signed_in? then
     @total_after = @total_before + current_user.total.to_i
     current_user.total = @total_after.to_s
     current_user.save
    if current_user.user_goals.exists?(finish: false) 
      if current_user.total.to_i >= current_user.user_goals.find_by(finish: false).goalMoney then
        rec = current_user.user_goals.find_by(finish: false)
        rec.finish = true
        rec.save
        current_user.total = 0
        current_user.save
      end
    end
  end
  end
  
end
