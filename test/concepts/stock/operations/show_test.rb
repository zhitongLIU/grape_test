require 'test_helper'

class StockShowTest < ActiveSupport::TestCase
  test 'should call policy#show?' do
    Stock::Policy.any_instance.expects(:show?).returns(true)
    Stock::Show.present(id: stocks(:one).id)
  end

  test 'should return find a stock' do
    Stock::Policy.any_instance.expects(:show?).returns(true)
    s = stocks(:one)
    op = Stock::Show.present(id: s.id)

    assert_equal s, op.model
  end

  test 'should raise not found if obj not exist' do
    assert_raise ActiveRecord::RecordNotFound do
      Stock::Show.present(id: 9999)
    end
  end
end
