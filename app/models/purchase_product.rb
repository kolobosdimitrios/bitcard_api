class PurchaseProduct < ApplicationRecord
  belongs_to :products
  belongs_to :purchases
end
