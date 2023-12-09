class UsersController < ApplicationController
  after_action :set_csrf_token_header
  skip_before_action :require_login, only: [:create]
  skip_before_action :verify_authenticity_token, only: :create

  def create
    user = User.new(user_params)
    if user.save
      render json: { user: user }, status: :ok
    else
      render json: { error: user.errors.full_messages }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation).merge(shop_id: 1)
  end
end
