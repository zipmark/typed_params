module TypedParameters
  class RequestBody
    def initialize(parameters = {})
      @parameters = parameters
    end

    # Credit to @kurko:
    # https://gist.github.com/kurko/0cec802b52dee691d82dffb159ca24ca
    def paths
      result = []

      @parameters.map do |key, value|
        path = [ key.to_s ]
        result << path

        if value.is_a?(Hash)
          remaining_parameters = self.class.new(value)
          remaining_parameters.paths
        end
      end
    end
  end
end
