class AddShopREferenceToPurchase < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchases, :shops, foreign_key: true
  end
end
