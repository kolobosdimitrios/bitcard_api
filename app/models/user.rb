class User < ApplicationRecord
    has_many :purchases, dependent: :destroy
    has_one :token, dependent: :destroy
end
