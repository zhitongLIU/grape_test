require 'test_helper'

class StockHistoryIndexTest < ActiveSupport::TestCase
  test 'should call policy#history_index?' do
    Stock::Policy.any_instance.expects(:history_index?).returns(true)
    s = stocks(:one)
    Stock::HistoryIndex.call(id: s.id)
  end

  test 'should return list of stocks' do
    s = stocks(:one)
    op = Stock::HistoryIndex.call(id: s.id)
    assert_instance_of Array, op.model
  end
end
