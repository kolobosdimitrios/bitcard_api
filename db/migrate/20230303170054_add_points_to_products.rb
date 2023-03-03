class AddPointsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :points, :integer, :default =>  0
  end
end
