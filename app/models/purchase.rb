class Purchase < ApplicationRecord
    belongs_to :token, dependent: :destroy
    has_many :purchase_products, dependent: :destroy
    belongs_to :shop, dependent: :destroy
end