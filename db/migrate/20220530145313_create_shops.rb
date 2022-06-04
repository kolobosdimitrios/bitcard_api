class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :shop_name, :null => false
      t.string :location_name, :null => false
      t.float :location_latitude, :null => false
      t.float :location_longitude, :null => false
      t.text :description, :null => false
      t.string :location_address, :null => false
      t.timestamps
    end
  end
end
