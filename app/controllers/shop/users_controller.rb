class Shop::UsersController < ShopController
  before_action :require_login
  before_action :set_shop, only: [:index, :create, :destroy, :show, :update]

  def index
    users = @shop.users
    render json: users
  end

  def new
  end

  def show
    user = @shop.users.find(params[:id])
    render json: user
  end

  def create
    user = @shop.users.new(user_params)
    if user.save
      render json: user, status: :created
    else

      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    user = @shop.users.find(params[:id])
    if user.update(user_params)
      render json: user, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = @shop.users.find(params[:id])
    user.destroy
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :role, :password, :password_confirmation).merge(shop_id: @current_user.shop.id)
  end

  def set_shop
    @shop = Shop.find(@current_user.shop.id)
  end
end
