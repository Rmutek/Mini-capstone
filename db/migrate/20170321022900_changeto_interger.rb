class ChangetoInterger < ActiveRecord::Migration[5.0]
  
  def change
    change_column :images, :product_id, "numeric USING CAST(product_id AS numeric)"
    change_column :images, :product_id, :integer
  end
end
