#
class Stock
  #
  class Show < Trailblazer::Operation
    include Trailblazer::Operation::Policy
    include Trailblazer::Operation::Model

    policy Stock::Policy, :show?
    model Stock, :find
  end
end
