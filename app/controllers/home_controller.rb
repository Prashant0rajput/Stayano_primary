class HomeController < ApplicationController
	 before_action :authenticate_user!
    skip_before_filter :verify_authenticity_token, :only => [:create_location]


def index
  lat = current_user.latitude
      lng = current_user.longitude
      distance = 5
     
      center_point = [lat, lng]
      box = Geocoder::Calculations.bounding_box(center_point, distance)
      @nearby_users = User.within_bounding_box(box)
    
    @post = Post.new
	   respond_to do |format|
      format.html{
              
              posts = current_user.posts.all ; 
              @posts = posts.order('created_at DESC');
              @users = User.all
      }
      format.js{}
      
    end
  
	
end

def users
	
  	@users = User.all
  	
end

  def destroy
    @user = current_user

    if @user.destroy
        redirect_to root_url, alert: "Account Deactivated Successfully"
    end
  end

  def settings

    
    @users = current_user
  
    
  end

  def location
      
      
      

      lat = current_user.latitude
      lng = current_user.longitude
      distance = 5
     
      center_point = [lat, lng]
      box = Geocoder::Calculations.bounding_box(center_point, distance)
      @nearby_users = User.within_bounding_box(box)
      @nearby_users_json = @nearby_users.first.latitude
       @user = User.all;
       # @nearby_users_json = params[:@nearby_users_json];
       respond_to do |format|
       format.html{}
       format.json {render :json => @nearby_users}


  end
      
     
      
    end


  def create_location
   
    

       
    
        lat = params[:latitude]
        lng = params[:longitude]
       user =  current_user
       user.latitude = lat
       user.longitude = lng
       # user.lat = lat
       # user.lng = lng
       user.save!    
    
     
  end


end



