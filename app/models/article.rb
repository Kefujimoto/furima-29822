class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :charge, :area, :days

  validates :category_id, :status_id, :charge_id, :area_id, :days_id, numericality: { other_than: 1 }

end
