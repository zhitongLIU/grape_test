#
module V1
  #
  class Stocks < V1::Base
    resource :stocks do
      desc 'get all stocks'
      get '/' do
        present Stock::Index.present(params).model, with: Entities::Stock
      end
    end
  end
end
