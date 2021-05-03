class OrderForm
  include ActiveModel::Model
  extend ActiveHash::Associations::ActiveRecordExtensions
 
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :phone_number, :building_name, :order_id, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :house_number
    validates :phone_number, numericality: { only_integer: true, message: "is invalid. Input half-width characters" }, length: { maximum: 11}
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 }


  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    Shippingaddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: @order.id)
  end
end