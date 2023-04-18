class PurchaseProduct < ApplicationRecord
  has_many :products
  belongs_to :purchase
end
