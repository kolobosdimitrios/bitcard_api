class CreatePurchaseProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_products do |t|
      t.references :products, null: false, foreign_key: true
      t.references :purchases, null: false, foreign_key: true

      t.timestamps
    end
  end
end
