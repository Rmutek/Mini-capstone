class CartedProductsController < ApplicationController

  def create 
    carted_product = CartedProduct.new(
    quantity: params[:quantity].to_i,
    product_id: params[:product_id],
    user_id: current_user.id,
    status: "carted"
    ) 
    carted_product.save
    flash[:success] = "Order Created!"
    redirect_to "/cart"
  end 

  def index
    @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
    render "index.html.erb"
  end 

end
