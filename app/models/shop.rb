class Shop < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :customers, dependent: :destroy
  has_many :bottles, dependent: :destroy
  has_many :keeped_bottles, through: :customers
end
