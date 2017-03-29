require 'typed_params/version'
require 'typed_params/request_body'
require 'typed_params/rules_format'
require 'typed_params/comparison'
require 'typed_params/rule'
require 'typed_params/parameter'
require 'typed_params/action_controller'
require 'core_extensions/hash'

module TypedParams
  Hash.include CoreExtensions::Hash
end
