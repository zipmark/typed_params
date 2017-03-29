module TypedParams
  module ActionController
    def self.included base
      base.extend ClassMethods
    end

    module ClassMethods
      def assert_params_format(rules_hash, options = {})
        before_action(only: options[:on]) do
          # FIXME: implement
        end
      end
    end
  end
end
