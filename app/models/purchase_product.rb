class PurchaseProduct < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :purchase, optional: true
end
