class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.decimal :value
      t.string :code
      t.integer :redeemed
     

      t.timestamps
    end
    add_reference :coupons, :user, foreign_key: true
  end
end
