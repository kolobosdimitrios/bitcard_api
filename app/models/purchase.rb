class Purchase < ApplicationRecord
    belongs_to :token
    has_many :products, dependent: :destroy 
end