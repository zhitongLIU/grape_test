#
module V1
  #
  class Stocks < Base
    resource :stocks do
      get '/' do
        Stock::Index.present(params).model
      end
    end
  end
end
