class OrdersController < ApplicationController
  def index
  	@orders = Order.where(user_id: current_user.id)
  end

  def new
  	@book = Book.find(params[:book_id])
  	@order = Order.new
  end

  def create
  	@order = Order.new(order_params)
  	@order.user = current_user
  	if @order.save
  		GeneratePdf.new(@order).exec
  		redirect_to @order
  	else
  		render :new
  	end
  end

  def show
  	@order = Order.find(params[:id])
  	redirect_to orders_url if @order.user_id != current_user.id
  end

  private
  def order_params
  	params.require(:order).permit(:book_id, :price)
  end
end
