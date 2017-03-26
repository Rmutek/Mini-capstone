class OrdersController < ApplicationController

  def create 
    @product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    tax = (@product.price * 0.09).round(3) * quantity
    
    order = Order.new(
    quantity: params[:quantity],
    product_id: params[:product_id],
    user_id: current_user.id,
    subtotal: @product.price * quantity,
    tax: @product.price * quantity * 0.09.round(3),
    total: (@product.price * quantity.to_i) + tax 
    ) 
    order.save
    flash[:success] = "Order Created!"
    redirect_to "/orders/#{order.id}"
  end 

  def show
    @order = Order.find_by(id: params[:id])
    render "show.html.erb"
  end 

end
