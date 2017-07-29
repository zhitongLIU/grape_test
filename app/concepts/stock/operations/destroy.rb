#
class Stock
  #
  class Destroy < Trailblazer::Operation
    include Trailblazer::Operation::Policy
    include Trailblazer::Operation::Model

    policy Stock::Policy, :destroy?
    model Stock, :find

    def process(_params)
      @model.destroy
    end
  end
end
