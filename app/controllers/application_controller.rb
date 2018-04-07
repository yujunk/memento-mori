class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :user_allowed?

  def authenticate_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      return true
    else
      if root_url
        return false
      else
        redirect_to sign_in_path
        return false
      end
    end
  end

  def save_login_state
    if session[:user_id]
      redirect_to root_url
      return false
    else
      return true
    end
  end

  def user_allowed?(action:, user:)
    if user.deputy?
      redirect_to URI(request.referrer).path, :flash => { :error => "As Deputy you are not allowed to perform this action" }
    else
      action
    end
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

end

  #authenticate_user - assigns the user object to the @current_user instance variable and authenticates
  #save_login_state - prevents the user from accessing the signup and login pages whilst logged in
  #allowed? - makes sure user sees pages relevant to them
