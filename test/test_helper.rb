ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/unit'
require 'mocha/mini_test'
require 'capybara/rails'
require 'capybara/minitest'

# To add Capybara feature tests add `gem 'minitest-rails-capybara'`
# to the test group in the Gemfile and uncomment the following:
# require 'minitest/rails/capybara'

# Uncomment for awesome colorful output
# require 'minitest/pride'

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
    # Add more helper methods to be used by all tests here...
  end
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  # Make `assert_*` methods behave like Minitest assertions
  include Capybara::Minitest::Assertions

  # Reset sessions and driver between tests
  # Use super wherever this method is redefined in your individual test classes
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

