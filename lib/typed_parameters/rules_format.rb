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

    def rule_at(chunks)
      condition = @rules.dig(*chunks) || raise(RuleNotFound)
      Rule.new(chunks, condition).decompose
    end
  end
end
