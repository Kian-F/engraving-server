class LineItemsController < ApplicationController
before_action :set_line_item, only:[:show, :edit, :update, :destroy]
  def index
    @line_item = LineItem.all
    render :json => @line_items, :include => [:product, :order]

  end

  def show

  end

  def edit
  end

  def new
    @line_item = LineItem.new
  end

  def create
    @line_item = LineItem.new(line_item_params)
    response_to do |format|
      if @line_item.save
        format.json{render :show, :created, status: :ok, location: @line_item }
      else
        format.json{render json: @line_item.errors, status: :unprocessable_entity  }
    end
  end
end

def update
  @line_item.update
  response_to do |format|
    if @line_item.update(line_item_params)
      format.json{render :show, :created, status: :ok, location: @line_item}
    else
      format.json{render json: @line_item.errors, status: :unprocessable_entity}
    end
  end
end

def destroy
 @line_item.destroy
  response_to do |format|
    format.json {head :no_content}
  end
end



private

def line_item_params
  params.require(:line_item).permit(:product_id, :quantity, :order_id)

end


def set_line_item
  @line_item = LineItem.find(params[:id])
end

end
