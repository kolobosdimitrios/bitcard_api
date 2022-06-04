class Shop < ApplicationRecord
    has_many :purchases, dependent: :destroy
end
