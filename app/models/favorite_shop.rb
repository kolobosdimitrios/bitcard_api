class FavoriteShop < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  validates :shop_id, uniqueness: {
     scope: :user_id,
     message: "each ralation must be unique" 
  }
end
