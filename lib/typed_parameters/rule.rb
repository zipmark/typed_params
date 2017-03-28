module TypedParameters
  class Rule
    attr_reader :location, :condition

    def initialize(location, condition)
      @location, @condition = location, condition
    end

    def enforce(attribute)
      begin
        attribute.is_a?(condition)
      rescue TypeError
        attribute.is_a?(condition.class)
      end
    end

    def blame(attribute)
      "param_cannot_be_#{attribute.class.name.downcase}_type"
    end

    def decompose
      # Always returns an instance of Rule
      begin
        self.class.new(location, condition.typed_json_attributes)
      rescue NoMethodError
        self
      end
    end

    def ==(object)
      object.class == self.class &&
        [object.location, object.condition] == [location, condition]
    end
  end
end
