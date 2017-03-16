class ProductsController < ApplicationController
  
  def index #purpose of index is to put the array 
    @products = Product.all.order(:name)
    render "index.html.erb"
  end 

  def new 
    render "new.html.erb"
  end 

  def create
    product = Product.new(
    name: params[:form_name],
    image: params[:form_image],
    price: params[:form_price],
    description: params[:form_description]
    ) 
    product.save
    flash[:success] = "Update Made!"
    render "create.html.erb"
  end 

  def show #purpose of show is to show one product 
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.html.erb"
  end 

  def edit 
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "edit.html.erb"
  end 

  def update 
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.name = params[:form_name]
    @product.image = params[:form_image]
    @product.price = params[:form_price]
    @product.description = params[:form_description]
    @product.save
    render "update.html.erb"
  end 

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    render "destroy.html.erb"
  end 

end
