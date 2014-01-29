class HomeController < ApplicationController
  def index
		render :layout => 'website'
  end
  
  def register
    k = Key.where({:label => params["key"]})
    if k.count == 0
      redirect_to :invalid_key
    end
    
    redirect_to :no_slots if !k.first.has_slots?
    
    @key_id = Key.retrieve_id(params[:key])
    
    if request.post?
      if Key.validate_label_by_id(params["UserData"]["key_id"], params[:key])      
        u = User.new
        u.name = params["UserData"]["name"]
        u.login = params["UserData"]["login"]      
        u.password = params["UserData"]["password"]
        u.key_id = params["UserData"]["key_id"]
      
        if u.save
          redirect_to :wait_soon
        else
          @errors = u.errors.messages.values.flatten
          @data = params["UserData"]
					render :layout => 'website'
        end
      else
        redirect_to root_url
      end
		else
			render :layout => 'website'
    end
  end
  
  def invalid_key
		render :layout => 'website'
  end
  
  def no_slots
		render :layout => 'website'
  end
  
  def wait_soon
		render :layout => 'website'
  end

	def review_grid
		@review = Review.limit(1).order("RANDOM()").first
		render :layout => 'bootstrap/navbar'
	end
end
