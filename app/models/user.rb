# This class represents an user
# @author Renan Oliveira - <a href="http://www.renanol.me/">www.renanol.me</a>
# @since 30/10/17
class User < ApplicationRecord
  validates :name, presence: true, length: { in: 1..255 }
  has_many :user_carts
end
