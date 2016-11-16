class ExcuseController < ApplicationController

  def create_excuse
    excuse = Excuse.create(excuse: "my_excuse")
 
    if excuse.save        
    redirect_to '/create_excuse'
    else
    render 'new'    
    end
  end
end
