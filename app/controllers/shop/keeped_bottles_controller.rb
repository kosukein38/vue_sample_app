class Shop::KeepedBottlesController < ShopController
  before_action :set_shop, only: [:index, :create, :destroy, :show, :update]
  
  def index
    keeped_bottles = @shop.keeped_bottles
    render json: keeped_bottles, include: [:customer]
  end

  def show
    keeped_bottle = @shop.keeped_bottles.find(params[:id])
    render json: keeped_bottle, include: [:customer, :bottle]
  end

  def create
    keeped_bottle = @shop.keeped_bottles.new(keeped_bottle_params)
    if keeped_bottle.save
      render json: keeped_bottle, status: :created
    else
      render json: { errors: keeped_bottle.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    keeped_bottle = @shop.keeped_bottles.find(params[:id])
    if keeped_bottle.update(keeped_bottle_params)
      render json: keeped_bottle, status: :ok
    else
      render json: { errors: keeped_bottle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    keeped_bottle = @shop.keeped_bottles.find(params[:id])
    keeped_bottle.destroy
    head :no_content
  end

  private

  def keeped_bottle_params
    params.require(:keeped_bottle).permit(:bottle_id, :bottle_number, :state, :open_date, :expiration_date).merge(customer_id: params[:customer_id])
  end

  def set_shop
    @shop = Shop.find(@current_user.shop.id)
  end

end
