class Product < ApplicationRecord
    validates :name, presence: true, length: { in: 1..255 }
    validates :price, presence: true
end
