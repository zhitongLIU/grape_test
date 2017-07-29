require 'test_helper'

class StockDestroyTest < ActiveSupport::TestCase
  test 'should call policy#show?' do
    Stock::Policy.any_instance.expects(:destroy?).returns(true)
    Stock::Destroy.call(id: stocks(:one).id)
  end

  test 'should return destroy a stock' do
    Stock::Policy.any_instance.expects(:destroy?).returns(true)
    s = stocks(:one)
    assert_difference 'Stock.count', -1 do
      Stock::Destroy.call(id: s.id)
    end

    assert_raise ActiveRecord::RecordNotFound do
      s.reload
    end
  end

  test 'should raise not found if obj not exist' do
    assert_raise ActiveRecord::RecordNotFound do
      Stock::Destroy.call(id: 9999)
    end
  end
end
