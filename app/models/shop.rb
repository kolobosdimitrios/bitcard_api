class Shop < ApplicationRecord
    has_many :purchases
    has_many :products
end
