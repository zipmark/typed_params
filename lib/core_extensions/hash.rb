module CoreExtensions
  module Hash
    # Credit to @kurko:
    # https://gist.github.com/kurko/0cec802b52dee691d82dffb159ca24ca
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
end
