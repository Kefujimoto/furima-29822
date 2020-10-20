class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :status
  belongs_to_active_hash :charge
  belongs_to_active_hash :area
  belongs_to_active_hash :days
  has_one :order
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :explain, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :charge_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :days_id, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/ } 

  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      item.all
    end
  end

end
