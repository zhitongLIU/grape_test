require 'test_helper'

class StockControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stocks_url
    assert_response :success
  end

  test "should create Stock" do
    assert_difference('Stock.count') do
      post stocks_url, params: { stock: { name: 'toto', quantity: 2 } }
    end

    assert_redirected_to stocks_url
  end

  test "should get edit" do
    get edit_stock_url(stocks(:one).id)
    assert_response :success
  end

  test "should update stock" do
    stock = stocks(:one)
    patch stock_url(stock.id), params: { stock: { name: 'haha', quantity: 33 } }
    assert_redirected_to stocks_url
  end
end
