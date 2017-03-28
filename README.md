# TypedParameters

The purpose of `typed_parameters` is to declare and enforce type constraints on your Rails API endpoints.

*NOTE*: We use 'parameter' and 'attribute' somewhat interchangably, as this is the same convention [used by Rails](http://api.rubyonrails.org/classes/ActionController/Parameters.html) (notice the usage of the two words throughout that documentation).

## Usage

Imagine you have a `Foo` model/resource, and a `FoosController`. You want to enforce a certain params structure for requests to `foos#create`.

```ruby
class FoosController < ActionController::API
  # enforce json-api format
  CreateFooParams = {
    data: {
      attributes: {
        name:  String,
        email: String
      }
    }
  }

  assert_params_format CreateFooParams, on: :create

  def create
    # If you reach this line, then the request body adheres to the type
    # declarations of CreateFooParams. Proceed with confidence!
  end
end
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

