class UsersController < ApplicationController
  before_action :save_login_state, :only => [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save

    session[:user_id] = @user.id

    redirect_to "/sign_in"
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

end

