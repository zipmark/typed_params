module TypedParams
  class Parameter
    attr_reader :location, :value

    def initialize(location, value)
      @location, @value = location, value
    end

    def ==(object)
      object.class == self.class &&
        [object.location, object.value] == [location, value]
    end
  end
end
