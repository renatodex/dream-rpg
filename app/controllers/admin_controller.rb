class AdminController < ApplicationController  
  layout 'admin'
  
  def index  
    @keys = Key.find(:all)  
  end

  def new
  end

  def create
  end
end
