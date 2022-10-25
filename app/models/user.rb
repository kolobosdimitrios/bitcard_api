class User < ApplicationRecord
    has_many :purchases, dependent: :destroy
    has_secure_password
end
