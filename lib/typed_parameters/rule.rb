module TypedParameters
  class Rule
    def initialize(location, condition)
      @location, @condition = location, condition
    end

    def enforce(attribute)
      attribute.is_a?(@condition)
    end
  end
end
