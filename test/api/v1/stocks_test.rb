require 'test_helper'

class StockTest < ActionDispatch::IntegrationTest
  test 'index should call Stock::Index operation' do
    mock = OpenStruct.new(model: [])
    params = {}
    Stock::Index.expects(:present).with(params).returns(mock)
    get '/api/v1/stocks', params: params
  end
end
