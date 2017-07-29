#
module V1
  #
  class Stocks < V1::Base
    include Defaults

    resource :stocks do
      desc 'get all stocks'
      get '/' do
        present Stock::Index.present(params).model, with: Entities::Stock
      end

      desc 'create a stock'
      params do
        requires :name, type: String, desc: 'name of the stock'
        optional :quantity, type: Integer, desc: 'quantity of the stock'
      end
      post '/' do
        present Stock::Create.call(params).model, with: Entities::Stock
      end

      desc 'get a stock'
      params do
        requires :id, type: String, desc: 'id of an stock'
      end
      get ':id' do
        present Stock::Show.present(params).model, with: Entities::Stock
      end

      desc 'update a stock'
      params do
        requires :id, type: String, desc: 'id of an stock'
        optional :name, type: String, desc: 'name of the stock'
        optional :quantity, type: Integer, desc: 'quantity of the stock'
      end
      put ':id' do
        present Stock::Update.call(params).model, with: Entities::Stock
      end

      desc 'get history of a stock'
      params do
        requires :id, type: String, desc: 'id of an stock'
      end
      get ':id/history' do
        present Stock::HistoryIndex.call(params).model, with: Entities::StockHistory
      end

      desc 'destroy a stock'
      params do
        requires :id, type: String, desc: 'id of an stock'
      end
      delete ':id' do
        Stock::Destroy.call(params).model
        @body = nil
      end
    end
  end
end
