class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #Sets the current user to the given user, creates a remember_token, stores a digest of that token in the user's column, stores the token as a cookie
  def log_in(user)
    @current_user = user
    token = SecureRandom.urlsafe_base64
    user.remember(token)
    session[:loginID] = token
  end

  def sign_out
    @current_user = nil
    reset_session
  end

  def get_current_user
    @current_user ||= User.find_by(remember_token: Digest::SHA1.hexdigest(session[:loginID].to_s))
  end

  def logged_in?
    get_current_user
    return @current_user ? true : false
  end
end
