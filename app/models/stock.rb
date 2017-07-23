#
class Stock < ApplicationRecord
  audited

  validates_with StockValidator
end
