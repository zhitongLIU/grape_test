#
class Stock
  #
  class Create < Trailblazer::Operation
    include Trailblazer::Operation::Policy
    include Trailblazer::Operation::Model

    policy Stock::Policy, :create?
    model Stock, :create

    contract do
      property :name, validates: { presence: true }
      property :quantity
    end

    def process(params)
      validate(params) do
        contract.save
      end
    end
  end
end
