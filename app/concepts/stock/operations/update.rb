#
class Stock
  #
  class Update < Trailblazer::Operation
    include Trailblazer::Operation::Policy
    include Trailblazer::Operation::Model

    policy Stock::Policy, :update?
    model Stock, :find

    contract do
      property :name
      property :quantity
    end

    def process(params)
      validate(params) do
        contract.save
      end
    end
  end
end
