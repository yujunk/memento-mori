# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end

def authenticate_user
  if session[:user_id]
    @current_user = User.find(session[:user_id])
    return true
  else
    redirect_to sign_in_path
    return false
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

#authenticate_user - assigns the user object to the @current_user instance variable
#save_login_state - prevents the user from accessing the signup and login pages whilst logged in

