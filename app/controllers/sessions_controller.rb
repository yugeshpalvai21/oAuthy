class SessionsController < ApplicationController
  before_action :check_user_signed_in, except: [:destroy]
  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'signed in successfully'
    else
      redirect_to sign_in_path, notice: 'email/password mismatch'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'signed Out Successfully'
  end

  private

  def check_user_signed_in
    if user_signed_in?  
      redirect_to root_path, notice: 'you already signed in' 
    else 
      true
    end
  end
end