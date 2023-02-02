class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.decimal :value, :null => false
      t.integer :points, :null => false
      t.string :barcode_value, :null => false, :unique => true
      t.integer :is_completed, :null => false, :default => 0
      t.integer :is_redeemed, :null => false, :default => 0
      t.belongs_to :user, foreign_key: true, index: {:unique => false}

      t.timestamps
    end
  end
end
