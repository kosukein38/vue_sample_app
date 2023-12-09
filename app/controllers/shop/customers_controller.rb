class Shop::CustomersController < ShopController
  before_action :set_shop, only: [:index, :create, :destroy, :show, :update]

  def index
    customers = @shop.customers
    render json: customers
  end

  def new
  end

  def show
    customer = @shop.customers.find(params[:id])
    render json: customer, include: [:keeped_bottles]
  end

  def create
    customer = @shop.customers.new(customer_params)
    if customer.save
      render json: customer, status: :created
    else
      render json: { errors: customer.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    customer = @shop.customers.find(params[:id])
    if customer.update(customer_params)
      render json: customer, status: :ok
    else
      render json: { errors: customer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    customer = @shop.customers.find(params[:id])
    customer.destroy
    head :no_content
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :age, :last_visit_date, :memo)
  end

  def set_shop
    @shop = Shop.find(@current_user.shop.id)
  end
end
