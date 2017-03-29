require 'active_support/core_ext/hash'
require 'active_model'

module TypedParameters
  class RequestBody
    include ActiveModel::Validations

    def initialize(parameters = {})
      @parameters = parameters.with_indifferent_access
    end

    def paths
      @parameters.paths.map { |p| p.split("/") }
    end

    # find(["data", "attributes", "name"])
    # Returns a Parameter instance when the path points to an existing param.
    # Returns nil otherwise.
    def find(path)
      param = parameter_at(path)
      Parameter.new(path, param) if param
    end

    private

    def parameter_at(chunks)
      @parameters.dig(*chunks)
    end
  end
end
