#
class StockValidator < ActiveModel::Validator
  def validate(record)
    validate_quantity(record)
  end

  private

  def validate_quantity(record)
    errmsg = 'quantity should be positive'
    record.errors[:quantity] << errmsg if record.quantity && record.quantity < 0
  end
end
