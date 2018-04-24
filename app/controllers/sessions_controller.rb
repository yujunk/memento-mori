class SessionsController < ApplicationController
  before_action :authenticate_user, :only => [:settings]
  before_action :save_login_state, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @authorized_user = User.authenticate_with_database(params[:user][:email], params[:user][:password])

    if @authorized_user
      session[:user_id] = @authorized_user.id
      redirect_to root_url
    else
      @user = User.new
      redirect_to sign_in_path, :flash => { :danger => "Wrong email or password. Please try again." }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def settings
  end
end

#https://www.sitepoint.com/rails-userpassword-authentication-from-scratch-part-ii/