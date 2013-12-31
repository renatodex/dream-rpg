class AdminController < ApplicationController  
  layout 'admin'
  
  def index  
    @keys = Key.find(:all)  
  end

  def new
  end

  def create
    k = Key.new
    k.label = params['KeyData']["label"]
    k.slots = params['KeyData']["slots"]    
    k.expiration_date= params['KeyData']["expiration_date"]    
    
    if k.save
      redirect_to :key_list
    end
  end
end
