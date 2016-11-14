class ExcuseController < ApplicationController

def create_excuse
    @excuse.excuse = params[:my_excuse].to_s
    @excuse.waste_money = params[:money].to_i * 1000
     
if @excuse.save

      redirect_to '/excuse' 

 else

      render '/setting'
end

end
end
