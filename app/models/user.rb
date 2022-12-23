class User < ApplicationRecord
    has_many :token, dependent: :destroy
end
