require 'active_support/core_ext/hash'

module TypedParams
  RuleNotFound = Class.new(StandardError)

  class RulesFormat
    def initialize(rules = {})
      @rules = rules.with_indifferent_access
    end

    def paths
      @rules.paths.map { |p| p.split("/") }
    end

    # find(["data", "attributes", "name"])
    # Returns a Rule instance when the path points to an existing rule.
    # Returns nil otherwise.
    def find(path)
      rule = @rules.dig(*path)
      Rule.new(path, rule) if rule
    end
  end
end
