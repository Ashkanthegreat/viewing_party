class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def user_logged_in
    render file: Rails.root.join('/public/404'), layout: true, status: :not_found unless current_user
  end
end
