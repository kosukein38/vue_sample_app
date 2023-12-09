class Shop::ShopsController < ShopController
  after_action :set_csrf_token_header
  before_action :require_login

  def show
    shop = current_user.shop
    render json: shop
  end

  def update
    shop = current_user.shop
    if shop.update(shop_params)
      render json: shop, status: :ok
    else
      render json: { errors: shop.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :email, :tel, :address, :url)
  end
end
