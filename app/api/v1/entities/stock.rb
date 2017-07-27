#
module V1
  #
  module Entities
    #
    class Stock < Grape::Entity
      expose :id
      expose :name
      expose :quantity
    end
  end
end
