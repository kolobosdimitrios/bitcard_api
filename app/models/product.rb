class Product < ApplicationRecord
    belongs_to :shop
    has_many :purchase_products
end
