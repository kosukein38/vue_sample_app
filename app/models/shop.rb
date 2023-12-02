class Shop < ApplicationRecord
  has_many :customers, dependent: :destroy
  has_many :bottles, dependent: :destroy
end
