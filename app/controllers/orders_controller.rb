class OrdersController < ApplicationController

  def create 
    carted_products = current_user.carted_products.where(status: "carted")
    subtotal = carted_products.inject(0){|sum, carted_product| sum + (carted_product.quantity) * (carted_product.product.price)}
    tax = (subtotal * 0.09).round(3)
    total = subtotal + tax
    
    
    @order = Order.new(
    user_id: current_user.id,
    subtotal: subtotal,
    tax: tax,
    total: total 
    ) 
    @order.save
    carted_products.update_all(status: "purchased", order_id: order.id)
    #or 
    # carted_products.each do |carted_product| 
    #     carted_product.order_id = @order.id
    #     carted_product.status = "purchased"
    #     carted_product.save
    # end
    flash[:success] = "Order Created!"
    redirect_to "/orders/#{@order.id}"
  end 

  def show
    @order = Order.find_by(id: params[:id])
    render "show.html.erb"
  end 

end
