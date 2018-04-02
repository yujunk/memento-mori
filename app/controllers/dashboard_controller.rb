class DashboardController < ApplicationController
  before_action :authenticate_user

  def show
    @user = User.find(params[:user_id])
  end
end


#https://stackoverflow.com/questions/7533449/rails-controller-design-pattern-for-dashboard