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
    end
  end
end
