class ApplicationController < ActionController::Base
   helper_method :user_signed_in?, :current_user
  private

  def user_signed_in?
    session[:user_id] ? true : false
  end

  def current_user
    if user_signed_in?
      @user ||= User.find(session[:user_id])
    else
      nil
    end
  end

  def authenticate_user
    if user_signed_in?
      true
    else
      redirect_to sign_up_path, notice: 'sign up first'
    end
  end
end
