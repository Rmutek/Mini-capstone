class ProductsController < ApplicationController

  before_action :authenticate_admin!, except: [:index, :show]
  
  def index #purpose of index is to put the array 
    # if session[:count] == nil
    # session[:count] += 1 #hash rails will use to save cookies 

    if params[:discounted] == "true" 
      @products = Product.where("price > ?",  35)
    elsif params[:category]
      category = Category.find_by(name: params[:category]) 
      @products = category.products
    else 
      sort_attribute = params[:sort_by] || "name" 
      sort_attribute_order = params[:sort_order] || "asc"
      @products = Product.all.order(sort_attribute => sort_attribute_order)
    end 
    render "index.html.erb" 
  end

  def new 
    unless current_user && current_user.admin 
      redirect_to "/"
      return 
    end 
    @product = Product.new 
    render "new.html.erb"
  end 

  def create
    unless current_user && current_user.admin 
      redirect_to "/"
      return 
    end 

    @product = Product.new(
    name: params[:form_name],
    image: params[:form_image],
    price: params[:form_price],
    description: params[:form_description]
    ) 
    if @product.save
      flash[:success] = "Update Made!"
      render "create.html.erb"
    else 
      render "new.html.erb"
    end 
  end 

  def show #purpose of show is to show one product 
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.html.erb"
  end 

  def edit
    unless current_user && current_user.admin
      redirect_to "/"
      return 
    end  

    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "edit.html.erb"
  end 

  def update 
    unless current_user && current_user.admin 
      redirect_to "/"
      return 
    end 

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
    unless current_user && current_user.admin 
      redirect_to "/"
      return 
    end 

    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    render "destroy.html.erb"
  end 

  def discounted 
    @product = Product.all
    render "discounted.html.erb"
  end 
end
 
