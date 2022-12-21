class User < ApplicationRecord
    has_one :token, dependent: :destroy
end
