class User < ApplicationRecord
    has_many :token, dependent: :destroy
    has_many :coupons, dependent: :destroy 
    has_many :favorite_shops, dependent: :destroy
end
