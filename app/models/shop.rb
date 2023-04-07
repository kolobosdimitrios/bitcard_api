class Shop < ApplicationRecord
    has_many :purchases, dependent: :destroy
    has_many :products, dependent: :destroy
    has_many :favorite_shops, dependent: :destroy
end
