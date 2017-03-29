require 'active_support/core_ext/hash'

module TypedParameters
  RuleNotFound = Class.new(StandardError)

  class RulesFormat
    def initialize(rules = {})
      @rules = rules.with_indifferent_access
    end

    def paths
      @rules.paths.map { |p| p.split("/") }
    end

    # find(["data", "attributes", "name"])
    # Raises an error if `rule` not found.
    # Returns a Rule instance when the path points to an existing param.
    def find(path)
      rule = @rules.dig(*path) || raise(RuleNotFound)
      Rule.new(path, rule)
    end

    private

    def rule_at(chunks)
      @rules.dig(*chunks)
    end
  end
end
