require 'test_helper'

class StockCreateTest < ActiveSupport::TestCase
  test 'should call policy#create?' do
    Stock::Policy.any_instance.expects(:create?).returns(true)
    Stock::Create.call(name: 'toto', quantity: 1)
  end

  test 'should create a stock' do
    Stock::Policy.any_instance.expects(:create?).returns(true)
    op = Stock::Create.call(name: 'toto', quantity: 1)
    stock = op.model

    assert_not_nil stock.id
    assert_equal 'toto', stock.name
    assert_equal 1, stock.quantity
  end

  test 'should fail to create a stock without name' do
    Stock::Policy.any_instance.expects(:create?).returns(true)
    res, op = Stock::Create.run(name: nil, quantity: 1)
    assert_not res
    msg = ["can't be blank"]
    assert_equal msg, op.errors.messages[:name]
  end

  test 'should create a stock without quantity' do
    Stock::Policy.any_instance.expects(:create?).returns(true)
    op = Stock::Create.call(name: 'toto', quantity: 0)
    stock = op.model

    assert_not_nil stock.id
    assert_equal 'toto', stock.name
    assert_equal 0, stock.quantity
  end
end
