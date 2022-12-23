class ChangeProductsSchema < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :purchase_id
    add_reference :products, :shops, foreign_key: true
  end
end
