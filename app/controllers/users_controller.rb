class UsersController < ApplicationController
  before_action :save_login_state, :only => [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    # array = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    # string = (0...10).map { array[rand(array.length)] }.join
    # check = User.find_by(session_token: string)

    # while (string == check)
    #   array = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    #   string = (0...10).map { array[rand(array.length)] }.join

    #   check = User.find_by(session_token: string)
    # end

    @user = User.new(user_params)
    # @user.session_token = string
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/sign_in"
    else
      redirect_to sign_up_path, :flash => { :error => "Something went wrong. Please try again." }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :random_token)
  end

  # def generate_random_token
    

  #   string
  # end

end

