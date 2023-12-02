class Shop::CustomersController < ShopController
  before_action :set_shop, only: [:create, :destroy, :show, :update]

  def index
    customers = Customer.all
    render json: customers
  end

  def new
  end

  def show
    customer = @shop.customers.find(params[:id])
    render json: customer
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Customer not found' }, status: :not_found
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
    @shop = Shop.find(1)
  end
end
