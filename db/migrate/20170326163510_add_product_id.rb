class AddProductId < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :name, :string
    add_column :category_products, :category_id, :integer
    add_column :category_products, :product_id, :integer
  end
end
