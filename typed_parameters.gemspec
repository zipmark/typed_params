# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'typed_parameters/version'

Gem::Specification.new do |spec|
  spec.name          = "typed_parameters"
  spec.version       = TypedParameters::VERSION
  spec.authors       = ["mecampbellsoup"]
  spec.email         = ["mecampbell25@gmail.com"]

  spec.summary       = %q{Enforce strong typing for API endpoints' parameters.}
  spec.description   = %q{Declare a rules format on a per-endpoint basis, and assert request documents adhere to them.}
  spec.homepage      = "https://github.com/mecampbellsoup/typed_parameters"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake",    "~> 10.0"
  spec.add_development_dependency "rspec",   "~> 3.0"
  spec.add_development_dependency "pry",     "~> 0.10"

  spec.add_runtime_dependency "activesupport", "~> 5"
end

