# This class represents an product
# @author Renan Oliveira - <a href="http://www.renanol.me/">www.renanol.me</a>
# @since 30/10/17
class Product < ApplicationRecord
  validates :name, presence: true, length: { in: 1..255 }
  validates :price, presence: true
end
