class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]
  skip_before_action :verify_authenticity_token, only: :create
  after_action :set_csrf_token_header, only: [:create, :show]

  def create
    user = login(params[:email], params[:password])
    if user
      render json: { user: user }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def show
    render json: { message: "logged in", userId: @current_user.id }
  end

  def destroy
    logout
    render json: { message: "logout succeed" }
  end
end

