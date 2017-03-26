require 'active_support/core_ext/hash'

module TypedParameters
  class RulesFormat
    def initialize(rules = {})
      @rules = rules.with_indifferent_access
    end

    def paths
      @rules.paths.map { |p| p.split("/") }
    end

    def rule_at(chunks)
      @rules.dig(*chunks)
    end
  end
end
