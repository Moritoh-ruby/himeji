class TopController < ApplicationController

  def index
  end
  def setting
  end
  def add_money
    if user_signed_in? then
      total_before = current_user.total.to_i
      total_after = total_before + params[:tweet_value].to_i
      current_user.total = total_after.to_s
      current_user.save
    end
    render action: :index 
  end
end
