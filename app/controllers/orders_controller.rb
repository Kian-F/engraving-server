class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
    render :json => @orders, :include => [:user, :line_items ]
  end

  def show
  end

  def edit
  end

  def new
    @order = Order.new
  end

 def create
   @order = Order.new(order_params)
   response_to do |format|
     if @order.save
       format.json{render :show, status: , :created, location: @order}
     else
       format.json {render json: @order.errors, status: :unprocessable_entity}
      end
     end
 end

 def update
   response_to do |format|
     if @order.update(order_params)
       formt.json{render :show, status: :ok, location: @order}
     else
         format.json {render json: @order.errors, status: :unprocessable_entity }
      end
     end
 end

 def generate_order
   order = Order.new
   order.total_price = params[:total_price]

   if params[:user_id].present?
     order.user_id = params[:user_id]
   else
     user = User.new
     user.orders << order
     user.name = params[:name]
     user.email = params[:email]
     user.address = params[:address]
     user.phone_number = params[:phone_number]
     user.save
   end

   orderItems = params[:orderItems]

   orderItems.each do |key, value|
     
   end





 end


  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id, :product_id, :line_item_id)
  end
end
