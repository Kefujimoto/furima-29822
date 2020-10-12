class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :items

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]\z/ }
  validates :lastname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]\z/ }
  validates :kana_firstname, presence: true, format: { with: /\A[ァ-ン]\z/ }
  validates :kana_lastname, presence: true, format: { with: /\A[ァ-ン]\z/ }
  validates :birthday, presence: true
end
