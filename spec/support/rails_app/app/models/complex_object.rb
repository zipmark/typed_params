class ComplexObject
  class << self
    def typed_json_attributes
      {
        foo: String,
        bar: String
      }
    end
  end
end
