class Purchase < ApplicationRecord
    belongs_to :token
    # has_many :products
    # belongs_to :shop
end