class CartedProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product
  belongs_to :user 

  # def product
  #   Product.find_by(id: self.product_id)
  # end
end
