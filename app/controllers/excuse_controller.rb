class ExcuseController < ApplicationController

  def create_excuse
    excuse = Excuse.new(excuse: "my_excuse")
 
    if excuse.save        
    redirect_to '/excuse'
    else
    render 'new'    
    end
  end
end
