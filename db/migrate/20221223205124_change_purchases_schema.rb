class ChangePurchasesSchema < ActiveRecord::Migration[6.0]
  def change
    remove_column :purchases, :price
    remove_column :purchases, :time
    remove_column :purchases, :pay_method
  end
end
