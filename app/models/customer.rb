class Customer < ApplicationRecord
  belongs_to :shop
  has_many :keeped_bottles, dependent: :destroy
end
