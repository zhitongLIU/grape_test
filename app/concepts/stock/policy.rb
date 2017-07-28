#
class Stock
  # Policy class for the Stock operations
  class Policy
    def initialize(user, stock)
      @user = user
      @stock = stock
    end

    def index?
      true
    end

    def show?
      true
    end

    def create?
      true
    end

    def update?
      true
    end
  end
end
