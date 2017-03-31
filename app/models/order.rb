class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product, optional: true
  has_many :carted_products 
  has_many :users, through: :carted_products
  has_many :products, through: :carted_products

  def calculate_totals 
    
  end 


end
