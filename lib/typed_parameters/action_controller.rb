module TypedParameters
  module ActionController
    def self.included base
      base.extend ClassMethods
    end

    module ClassMethods
      def assert_params_format(rules_hash, options = {})
        before_action(only: options[:on]) do
          req   = TypedParameters::RequestBody.new(params)
          rules = TypedParameters::RulesFormat.new(rules_hash)
          req.enforce_format(rules)

          if req.errors.present?
            yield req if block_given?
            render json: req.errors
          end
        end
      end
    end
  end
end
