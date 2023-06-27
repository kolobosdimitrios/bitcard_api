class RemoveShopPurchaseRelation < ActiveRecord::Migration[6.0]
  def change
    # 
    remove_index :purchases, name: "index_purchases_on_shops_id"
    
  end
end
