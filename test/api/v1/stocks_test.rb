require 'test_helper'

class StockTest < ActionDispatch::IntegrationTest
  test 'index should call Stock::Index operation' do
    mock = OpenStruct.new(model: [])
    params = {}
    Stock::Index.expects(:present).with(params).returns(mock)
    get '/api/v1/stocks', params: params
  end

  test 'index should call Stock::Show operation' do
    mock = OpenStruct.new(model: [])
    params = { 'id' => 1 }
    Stock::Show.expects(:present).with(params).returns(mock)
    get '/api/v1/stocks/1', params: params
  end
end
