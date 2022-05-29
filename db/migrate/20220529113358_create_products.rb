class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, :null => false
      #Ex:- :null => false
      t.decimal :value
      t.text :description, :null => false
      t.string :code, :null => false
      t.string :barcode, :null => false
      t.belongs_to :purchase, foreign_key: true, index: {:unique => true}
      t.timestamps
    end
  end
end
