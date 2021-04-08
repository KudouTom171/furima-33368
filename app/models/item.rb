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

  validates :item_name, presence: true
  validates :item_detail, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :shipping_fee_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :lead_time_id, numericality: { other_than: 1 } 
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } 
  validates :image, presence: true

  def was_attached?
    self.image.attached?
  end

end
