# frozen_string_literal: true
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'typed_params'
require 'awesome_print'
require 'pry'

# Coverage
if ENV["CIRCLECI"]
  require 'simplecov'
  SimpleCov.start
end

# Require the Rails app for integration testing
Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each do |file|
  next if file.include?('support/rails_app')

  require file
end
