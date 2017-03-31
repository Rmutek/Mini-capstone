class CartedProductsController < ApplicationController
  before_action :authenticate_user!

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
    if @carted_products.length > 0 
      render "index.html.erb"
    else 
      flash[:warning] = "You have nothing in your cart."
      redirect_to "/"
    end
  end 

  def destroy 
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    flash[:success] = "Successfully removed"
    redirect_to "/cart"
  end 

end
