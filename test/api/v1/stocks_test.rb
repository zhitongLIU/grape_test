require 'test_helper'

class StocksTest < ActionDispatch::IntegrationTest
  test 'index should call Stock::Index operation' do
    mock = OpenStruct.new(model: [])
    params = {}
    Stock::Index.expects(:present).with(params).returns(mock)
    get '/api/v1/stocks', params: params
  end

  test 'index should call Stock::Show operation' do
    mock = OpenStruct.new(model: [])
    params = { 'id' => '1' }
    Stock::Show.expects(:present).with(params).returns(mock)
    get '/api/v1/stocks/1', params: params
  end

  test 'create should call Stock::Create operation' do
    mock = OpenStruct.new(model: [])
    params = { 'name' => 'thth', 'quantity' => 1 }
    Stock::Create.expects(:call).with(params).returns(mock)
    post '/api/v1/stocks', params: params
  end

  test 'update should call Stock::Update operation' do
    mock = OpenStruct.new(model: [])
    params = { 'id' => '1', 'name' => 'thth', 'quantity' => 1 }
    Stock::Update.expects(:call).with(params).returns(mock)
    put '/api/v1/stocks/1', params: params
  end

  test 'history_index should call Stock::HistoryIndex operation' do
    mock = OpenStruct.new(model: [])
    params = { 'id' => '1' }
    Stock::HistoryIndex.expects(:call).with(params).returns(mock)
    get '/api/v1/stocks/1/history', params: params
  end
end
