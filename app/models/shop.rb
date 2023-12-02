class Shop < ApplicationRecord
  has_many :customers, dependent: :destroy
end
