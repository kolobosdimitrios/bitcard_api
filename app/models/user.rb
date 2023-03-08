class User < ApplicationRecord
    has_many :token, dependent: :destroy
    has_many :coupons, dependent: :destroy 
end
