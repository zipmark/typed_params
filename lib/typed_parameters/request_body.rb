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

    def parameter_at(chunks)
      @parameters.dig(*chunks)
    end

    def enforce_format(rules)
      # NOTE: may also need to iterate over RequestBody#paths
      # to ensure extra params not included.
      rules.paths.each do |path|
        # 1/ cast each rule to a Rule object
        rule = rules.rule_at(path)
        # 2/ compare each Rule to its param at the same path
        param = parameter_at(path)
        compare(rule, param)
      end
    end

    private

    def compare(rule, param)
      path_to_param = rule.location.join("/")

      if param.blank?
        errors.add(path_to_param, "missing_required_param") if param.blank?
      else
        if !rule.enforce(param)
          errors.add(path_to_param, rule.blame(param))
        end
      end
    end
  end
end
