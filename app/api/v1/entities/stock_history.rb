#
module V1
  #
  module Entities
    #
    class StockHistory < Grape::Entity
      expose :audited_changes
      expose :revision
      expose :created_at
      expose :version
      expose :action
    end
  end
end
