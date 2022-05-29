class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|

      t.decimal :price
      t.datetime :time
      t.string :pay_method, :null => false
      t.belongs_to :user, foreign_key: true, index: {:unique => false}
      

      t.timestamps
    end
  end
end
