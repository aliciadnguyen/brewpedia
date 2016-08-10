class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    # current_user determins whether a user is logged in or logged out.
    # It does this by checking whether there's a user in the database with
    # a given session id. If there is, this means the user is logged in
    # and @current_user will store tha tuser, otherwise the user is logged
    # out and @current_user will be nill
    # @current_user || @current_user = User.find...
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def require_user
    redirect_to '/login' unless current_user
  end

end
