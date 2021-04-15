class ApplicationController < ActionController::Base
  # helper_method :user_signed_in?, :current_user
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
  
  private

  # def user_signed_in?
  #   session[:user_id] ? true : false
  # end

  # def current_user
  #   if user_signed_in?
  #     @user ||= User.find(session[:user_id])
  #   else
  #     nil
  #   end
  # end

  # def authenticate_user
  #   if user_signed_in?
  #     true
  #   else
  #     redirect_to sign_up_path, notice: 'sign up first'
  #   end
  # end

  # def redirect_signed_in_user
  #   redirect_to root_path, notice: 'You cant register while youre signed in' if user_signed_in?
  # end
end
