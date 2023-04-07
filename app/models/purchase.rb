class Purchase < ApplicationRecord
    belongs_to :tokens
    has_many :purchase_products
end