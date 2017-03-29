module TypedParams
  class Rule
    attr_reader :location, :condition

    def initialize(location, condition)
      @location, @condition = location, condition
    end

    def ==(object)
      object.class == self.class &&
        [object.location, object.condition] == [location, condition]
    end
  end
end
