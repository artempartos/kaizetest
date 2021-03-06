module AuthHelper

  def sign_in(user)
    session[:user_id] = user.id
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #@current_user ||= user_from_remember_token
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    session[:user_id] = nil
    self.current_user = nil
  end

  def redirect_back_or(default, opt={})
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def authenticate
    deny_access unless signed_in?
  end

  private

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_return_to
    session[:return_to] = nil
  end

  def deny_access
    store_location
    redirect_to new_session_path, :notice => t(:access_denied)
  end

end
