class UsersController < ApplicationController
  before_action :check_user_signed_in
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User Registration Completed...'
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def check_user_signed_in
    if user_signed_in?  
      redirect_to root_path, notice: 'you already signed in' 
    else 
      true
    end
  end
end