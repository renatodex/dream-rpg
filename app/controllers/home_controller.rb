class HomeController < ApplicationController
  layout 'website'
  
  def index
  end
  
  def register
    
    k = Key.where({:label => params["key"]})
    if k.count == 0
      redirect_to :invalid_key
    end
  end
  
  def invalid_key
  end
end
