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

  spec.files         = Dir.glob("{bin,lib}/**/*") + %w(LICENSE.txt README.md)
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Runtime deps
  spec.add_runtime_dependency "activesupport", "~> 5"
  spec.add_runtime_dependency "activemodel",   "~> 5"

  # Debugging and develoment
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake",    "~> 10.0"
  spec.add_development_dependency "rspec",   "~> 3.0"
  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'pry'

  # Test this gem with a rails app (integration specs)
  # https://codingdaily.wordpress.com/2011/01/14/test-a-gem-with-the-rails-3-stack/
  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'rspec-rails'
end

