require 'test_helper'

class StockIndexTest < ActiveSupport::TestCase
  test 'should call policy#index?' do
    Stock::Policy.any_instance.expects(:index?).returns(true)
    Stock::Index.present({})
  end

  test 'should return list of stocks' do
    op = Stock::Index.present({})
    assert_instance_of Stock::ActiveRecord_Relation, op.model
    op.model.each do |stock|
      assert_instance_of Stock, stock
    end
  end

  test 'should return be able to limit nomber per page' do
    per_page = 1
    op = Stock::Index.present(per_page: per_page)
    assert_equal per_page, op.model.count
    assert Stock.count > 1
  end

  test 'should return be able to select page' do
    per_page = 1
    op = Stock::Index.present(page: 1, per_page: per_page)
    assert_equal per_page, op.model.count
    assert Stock.count > 1
  end
end
