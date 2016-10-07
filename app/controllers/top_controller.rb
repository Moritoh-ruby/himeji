class TopController < ApplicationController

  def index
  end
  def setting
  end
  def addMoney
    current_user.total = params[:kane1]
  end
end
