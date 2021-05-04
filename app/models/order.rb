class Order < ApplicationRecord
  belongs_to :user
  has_one :shippingaddress
  belongs_to :item
end