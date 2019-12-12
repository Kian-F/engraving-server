class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :line_items, :through => :orders

end
