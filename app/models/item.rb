class Item < ApplicationRecord
  has_one :order
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :explain, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :charge_id, presence: true
  validates :area_id, presence: true
  validates :days_id, presence: true
  validates :price, presence: true, numericality: {greater_than: 300, less_than: 9999999}, format: { with: /\A[0-9]+\z/ } 
  
end
