require 'active_support/core_ext/hash'

module TypedParameters
  class RequestBody
    def initialize(parameters = {})
      @parameters = parameters.with_indifferent_access
    end

    def paths
      @parameters.paths.map { |p| p.split("/") }
    end

    def parameter_at(chunks)
      @parameters.dig(*chunks)
    end
  end
end
