class CartedProduct < ApplicationRecord
  belongs_to :orders 
  belongs_to :products 
  belongs_to :users 
end
