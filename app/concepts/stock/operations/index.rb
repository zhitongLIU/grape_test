#
class Stock
  #
  class Index < Trailblazer::Operation
    include Trailblazer::Operation::Policy

    policy Stock::Policy, :index?

    def model!(params)
      page = params.delete(:page) || 1
      per_page = params.delete(:per_page) || 10
      Stock.page(page).per(per_page)
    end
  end
end
