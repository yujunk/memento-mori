class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email], password: params[:user][:password])

    redirect_to root_url
  end

end
