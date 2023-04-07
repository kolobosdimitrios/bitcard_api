class CreateFavoriteShops < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_shops do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
