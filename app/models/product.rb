class Product < ApplicationRecord
  has_many :images
  has_many :orders, through: :carted_products
  belongs_to :supplier
  has_many :category_products 
  has_many :categories, through: :category_products
  has_many :user, through: :carted_products
  has_many :carted_products

  validates :name, presence: true 
  validates :name, uniqueness: true
  validates :price, presence: true 
  validates :price, numericality: true
  validates :description, length: { maximum: 500 }
  
  def sales_message 
    if price < 35
      "Discounted Item!"
    else 
      "Full Price"
    end
  end

  def tax 
    (price * 0.09).round(3)
  end 

  def total
    price + tax
  end 

  def discounted? 
    return price.to_f < 25
  end 

  def supplier
    Supplier.find_by(id: self.supplier_id)
  end

end
