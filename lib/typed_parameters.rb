require 'typed_parameters/version'
require 'typed_parameters/request_body'
require 'typed_parameters/rules_format'
require 'typed_parameters/rule'
require 'typed_parameters/action_controller'
require 'core_extensions/hash'

module TypedParameters
  Hash.include CoreExtensions::Hash
end
