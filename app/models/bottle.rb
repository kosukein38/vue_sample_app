class Bottle < ApplicationRecord
  belongs_to :shop
  has_many :keeped_bottles, dependent: :destroy
  enum category: { shochu: 1, whisky: 2, gin: 3, rum: 4, brandy: 5, other: 100 }
end
