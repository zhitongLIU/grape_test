require 'test_helper'

class StockTest < ActiveSupport::TestCase
  test 'index? should return true' do
    user = OpenStruct.new
    stock = OpenStruct.new
    assert Stock::Policy.new(user, stock).index?
  end
end
