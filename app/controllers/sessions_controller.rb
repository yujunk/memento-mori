class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @authorized_user = User.authenticate(params[:user][:email], params[:user][:password])

    if @authorized_user
      redirect_to root_url
    else
      @user = User.new
      redirect_to sign_in_path
    end
  end

end
