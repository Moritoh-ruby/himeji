class ExcuseController < ApplicationController

  def create_excuse
    excuse = Excuse.new(excuse: "my_excuse", waste_money: "money1")
 
    if excuse.save        
    redirect_to '/setting' 
    else
    render 'excuse'    
    end
  end
end
