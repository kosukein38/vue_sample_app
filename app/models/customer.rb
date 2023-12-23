class Customer < ApplicationRecord
  belongs_to :shop
  has_many :keeped_bottles, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
  validates :age, numericality: { in: 0..150 }
  validates :memo, length: { maximum: 200 }
end
