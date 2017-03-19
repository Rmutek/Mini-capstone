class StockStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :stock, :string
  end
end
