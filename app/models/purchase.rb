class Purchase < ApplicationRecord
    belongs_to :token
    has_many :purchase_products
end