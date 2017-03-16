class Product < ApplicationRecord

  def sales_message 
    if price < 30
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

end
