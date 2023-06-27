class RemoveShopIdColumnFromPurchase < ActiveRecord::Migration[6.0]
  def change
    remove_column :purchases, :shops_id
  end
end
