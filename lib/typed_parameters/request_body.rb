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

# Credit to @kurko:
# https://gist.github.com/kurko/0cec802b52dee691d82dffb159ca24ca
class Hash
  def paths(prefix = nil)
    result = []
    self.each do |k, v|
      path = prefix ? "#{prefix}/#{k}" : k
      result << path.to_s
      result << v.paths(path) if v.is_a?(Hash)
    end

    result.flatten
  end
end
