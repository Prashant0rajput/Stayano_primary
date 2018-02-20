class ApplicationController < ActionController::Base
 
  protect_from_forgery with: :exception
  before_action :verify_authenticity_token
   #before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?
 
  protected
 
 before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username,:age,:gender, :email, :password,
      :password_confirmation, :remember_me, :avatar, :avatar_cache, :remove_avatar) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username,:age,:gender, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar) }
  end


  def sign_up_params
  devise_parameter_sanitizer.sanitize(:sign_up)
end

def account_update_params
  devise_parameter_sanitizer.sanitize(:account_update)
end

  private

  def sign_up_params
    params.require(:user).permit(:username, :age,:gender, :email, :password, :password_confirmation , :avatar, :avatar_cache)
  end

  def account_update_params
    params.require(:user).permit(:username, :age,:gender, :email, :password, :password_confirmation, :current_password , :avatar, :avatar_cache, :remove_avatar)
  end

  
end
