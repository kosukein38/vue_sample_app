class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception
  before_action :require_login

  def require_login
    if current_user.blank?
      render json: { message: "unauthorized" }, status: 401
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_csrf_token_header
    response.set_header("X-CSRF-Token", form_authenticity_token)
  end
end
