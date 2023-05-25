class Purchase < ApplicationRecord
    belongs_to :token
    belongs_to :shop

    has_many :purchase_products
end