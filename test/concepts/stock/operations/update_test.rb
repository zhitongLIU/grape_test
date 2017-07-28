require 'test_helper'

class StockUpdateTest < ActiveSupport::TestCase
  test 'should call policy#update?' do
    Stock::Policy.any_instance.expects(:update?).returns(true)
    s = stocks(:one)
    Stock::Update.call(id: s.id, name: 'toto', quantity: 1)
  end

  test 'should update a stock' do
    Stock::Policy.any_instance.expects(:update?).returns(true)
    s = stocks(:one)
    new_q = 9
    new_n = 'titi'
    assert_not_equal s.quantity, new_q
    assert_not_equal s.name, new_n
    op = Stock::Update.call(id: s.id, name: new_n, quantity: new_q)
    stock = op.model

    assert_equal new_n, stock.name
    assert_equal new_q, stock.quantity
  end
end
