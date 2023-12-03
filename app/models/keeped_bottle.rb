class KeepedBottle < ApplicationRecord
  belongs_to :bottle
  belongs_to :customer
  enum state: { unopend: 0, opend: 1, discard: 100 }
end
