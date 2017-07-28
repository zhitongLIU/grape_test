require 'test_helper'

class StockPolicyTest < ActiveSupport::TestCase
  test 'index? should return true' do
    user = OpenStruct.new
    stock = OpenStruct.new
    assert Stock::Policy.new(user, stock).index?
  end

  test 'show? should return true' do
    user = OpenStruct.new
    stock = OpenStruct.new
    assert Stock::Policy.new(user, stock).show?
  end

  test 'create? should return true' do
    user = OpenStruct.new
    stock = OpenStruct.new
    assert Stock::Policy.new(user, stock).create?
  end

  test 'update? should return true' do
    user = OpenStruct.new
    stock = OpenStruct.new
    assert Stock::Policy.new(user, stock).update?
  end
end
