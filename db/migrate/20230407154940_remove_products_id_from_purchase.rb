class RemoveProductsIdFromPurchase < ActiveRecord::Migration[6.0]
  def change
    remove_column :purchases, :products_id
  end
end
