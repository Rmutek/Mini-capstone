class Supplier < ApplicationRecord

  def product
    Product.where(supplier_id: self.id)
  end 
end
