require 'typed_parameters/version'
require 'typed_parameters/request_body'
require 'typed_parameters/rules_format'
require 'core_extensions/hash'

module TypedParameters
  Hash.include CoreExtensions::Hash
end
