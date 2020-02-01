# typed: false

# At the top of the file as per Simple Cov documentation.
#
# https://github.com/colszowka/simplecov
require "simplecov"

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"

# Required by SimpleCov because we are using Spring.
#
# https://github.com/colszowka/simplecov
# https://github.com/colszowka/simplecov/issues/381#issuecomment-347651728
Rails.application.eager_load!

require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Merge the SimpleCov reports form the various test processes
  #
  # https://github.com/colszowka/simplecov/issues/718
  parallelize_setup do |worker|
    SimpleCov.command_name "#{SimpleCov.command_name}-#{worker}"
  end

  parallelize_teardown do
    SimpleCov.result
  end

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
