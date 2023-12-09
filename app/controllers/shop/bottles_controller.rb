class Shop::BottlesController < ShopController
  before_action :set_shop, only: [:index, :create, :destroy, :show, :update]

  def index
    bottles = @shop.bottles
    render json: bottles
  end

  def new
  end

  def show
    bottle = @shop.bottles.find(params[:id])
    render json: bottle
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Bottle not found' }, status: :not_found
  end

  def create
    bottle = @shop.bottles.new(bottle_params)
    if bottle.save
      render json: bottle, status: :created
    else
      render json: { errors: bottle.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    bottle = @shop.bottles.find(params[:id])
    if bottle.update(bottle_params)
      render json: bottle, status: :ok
    else
      render json: { errors: bottle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    bottle = @shop.bottles.find(params[:id])
    bottle.destroy
    head :no_content
  end

  private

  def bottle_params
    params.require(:bottle).permit(:name, :category, :price, :description)
  end

  def set_shop
    @shop = Shop.find(@current_user.shop.id)
  end
end
