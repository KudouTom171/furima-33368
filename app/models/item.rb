class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchasedhistory
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :lead_time
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :item_detail
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 1} do
    validates :category_id 
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :lead_time_id
  end

  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } 

end
