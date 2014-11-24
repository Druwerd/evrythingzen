class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def admin_only
    unless current_user.admin?
      redirect_to root_url, :alert => "Access denied."
    end
  end

  def admin_or_contributor
    unless current_user.admin? || current_user.contributor?
      redirect_to root_url, :alert => "Access denied."
    end
  end

  def login_required
    redirect_to root_url unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
