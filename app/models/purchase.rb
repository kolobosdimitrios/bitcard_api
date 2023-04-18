class Purchase < ApplicationRecord
    belongs_to :tokens, dependent: :destroy
    has_many :purchase_products, dependent: :destroy
    belongs_to :shop, dependent: :destroy
end