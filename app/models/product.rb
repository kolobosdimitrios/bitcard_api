class Product < ApplicationRecord
    belongs_to :shop
    belongs_to :purchase_product
end
