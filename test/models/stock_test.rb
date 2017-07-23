require 'test_helper'

class StockTest < ActiveSupport::TestCase
  test 'should raise if name nil' do
    assert_raise ActiveRecord::StatementInvalid do
      Stock.create(name: nil, quantity: 0)
    end
  end

  test 'should raise if quantity nil' do
    assert_raise ActiveRecord::StatementInvalid do
      Stock.create(name: 'name', quantity: nil)
    end
  end

  test 'should not valid if quantity is negative ' do
    s = Stock.create(name: 'name', quantity: -999)
    assert_not s.valid?
  end

  test 'should be able to create with name and quantity' do
    s = Stock.new(name: 'name', quantity: 999)
    assert s.valid?
    assert_difference 'Stock.count', 1 do
      s.save
    end
  end

  test 'should record it\'s revisions' do
    old_name = 'name'
    old_q = 888
    s = Stock.create(name: old_name, quantity: old_q)
    assert_difference 's.revisions.count', 1 do
      s.update name: 'blabla', quantity: 0
    end

    assert_equal old_name, s.revisions.first.name
    assert_equal old_q, s.revisions.first.quantity
  end

  test 'should be able to know which attributes has been changed' do
    s = stocks(:one)
    s.update name: 'blabla', quantity: 0

    changes = s.audits.last.audited_changes
    assert_equal %w(toto blabla), changes['name']
    assert_equal [1, 0], changes['quantity']
  end
end
