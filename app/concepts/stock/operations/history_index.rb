#
class Stock
  #
  class HistoryIndex < Trailblazer::Operation
    include Trailblazer::Operation::Policy
    include Trailblazer::Operation::Model

    model Stock, :find
    policy Stock::Policy, :history_index?

    def process(_params)
      @model = @model.revisions.reverse
    end
  end
end
