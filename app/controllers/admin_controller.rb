class AdminController < ApplicationController  
  layout 'admin'
  
  http_basic_authenticate_with :name => "barosobaro", :password => "pepsi_#{Time.new.yday}"
  def index  
    @keys = Key.find(:all)  
  end

  def new
  end

  def create
    k = Key.new
    k.label = Digest::SHA1.hexdigest rand(99999999999999999999).to_s
    k.slots = params['KeyData']["slots"]    
    k.expiration_date= params['KeyData']["expiration_date"]    
    
    if k.save
      redirect_to :key_list
    end
  end
  
  def key_users
    k = Key.where({:label => params[:key]})
    @users = k.first.users
    @key_label = k.first.label
  end
end