module TypedParams
  class Comparison
    # Example usage:
    # Expected types for arguments indicated on the next line.
    # Comparison.new(rules_format: RulesFormat, request_body: RequestBody)
    #
    def initialize(rules_format:, request_body:)
      @rules_format, @request_body = rules_format, request_body
    end

    # Example usage:
    # comparison.errors =>
    # Returns nil when there are no errors when comparing the
    # rules_format to the request_body.
    # Otherwise, returns an object where each key is the path to the
    # problematic parameter and whose value describes the problem.
    def errors
      @errors = {}

      rule_paths.each do |path|
        param_with_rule = ParameterWithRule.new(
          rule:      @rules_format.find(*path),
          parameter: @request_body.find(*path)
        )

        error = param_with_rule.validate
        path_string = path.join("/")
        @errors[path_string] = param_with_rule.validate if error
      end

      @errors if !@errors.empty?
    end

    private

    # List of parameters corresponding to the rules locations.
    def parameters
      @parameters ||= paths.map { |path| @request_body.find(*path) }
    end

    def rule_paths
      @rules_format.paths
    end
  end

  class ParameterWithRule
    def initialize(parameter:, rule:)
      @parameter, @rule = parameter, rule
    end

    # Return nil if the parameter meets the rule's constraint(s).
    # Otherwise return a tuple conforming to (path_to_param, reason_not_valid).
    def validate
      if !parameter.value.is_a?(rule.condition)
        "param_must_be_#{rule.condition.name.downcase}"
      end
    end

    private

    attr_reader :parameter, :rule
  end
end
