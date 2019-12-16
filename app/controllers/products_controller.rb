class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    render :json => @products
  end

  def show
    @product = Product.find params[:id]
  end

  def edit
  end

  def new
  end



private

 def set_product
   @product = Product.find(params[:id])
 end

def product_params
  params.require(:product).permit(:id, :name, :line_item_id, :order_id)
end

end
