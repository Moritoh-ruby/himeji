class UpdateController < ApplicationController

  def show
    @user = User_goals.find(params[:user_id])
  end
    
  def new
    @user = User.new
   end

  def create
    @user = User.new(new_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User_goals.find(params[:user_id])
  end

  private

    def user_params
      params.require(:user).permit(:buttonStr, :goalMoney)
    end

end 

