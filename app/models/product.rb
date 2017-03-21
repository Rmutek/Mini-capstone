class Product < ApplicationRecord

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
