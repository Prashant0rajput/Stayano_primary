class RegistrationsController < Devise::RegistrationsController

skip_before_filter :verify_authenticity_token, :only => :create

def sign_up_params
  devise_parameter_sanitizer.sanitize(:sign_up)
end

def account_update_params
  devise_parameter_sanitizer.sanitize(:account_update)
end

  private

  def sign_up_params
    params.require(:user).permit(:username, :age,:gender, :email, :password, :password_confirmation ,:coverpic, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:username, :age,:gender, :email, :password, :password_confirmation, :current_password ,:coverpic, :avatar)
  end

   protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end

