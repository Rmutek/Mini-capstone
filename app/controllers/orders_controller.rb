class OrdersController < ApplicationController

  def create 
    tax = (price * 0.09).round(3)
    total = price + tax
    order = Order.new(
    quantity: params[:quantity],
    product_id: params[:product_id],
    subtotal: product.price,
    tax: tax,
    total: total
    ) 
    order.save
    flash[:success] = "Order Created!"
    redirect_to "/orders/:id"
  end 

  def show

    render "show.html.erb"
  end 

end
