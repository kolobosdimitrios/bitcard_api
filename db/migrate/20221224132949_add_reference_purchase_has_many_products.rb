class AddReferencePurchaseHasManyProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchases, :products, foreign_key: true
    remove_column :purchases, :shop_id
  end
end
