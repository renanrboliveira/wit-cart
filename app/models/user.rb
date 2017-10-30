class User < ApplicationRecord
    validates :name, presence: true, length: { in: 1..255 }
    has_many :user_carts
end
