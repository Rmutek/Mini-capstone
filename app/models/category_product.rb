class CategoryProduct < ApplicationRecord
  belongs_to :product 
  belongs_to :category 
  validates :quantity, presence: true 
  validates :quantity, numericality: { greater_than: 0 }
end
