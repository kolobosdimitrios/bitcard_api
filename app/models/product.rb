class Product < ApplicationRecord
    belongs_to :shop, dependent: :destroy
end
