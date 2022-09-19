ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"
Minitest::Reporters.use!

# Consider setting MT_NO_EXPECTATIONS to not add expectations to Object.
# ENV["MT_NO_EXPECTATIONS"] = true

Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  setup do
    ActiveStorage::Current.url_options = {protocol: "https://", host: "example.com", port: nil}
  end

  teardown do
    ActiveStorage::Current.reset
  end

  # Add more helper methods to be used by all tests here...
end

ActiveStorage::FixtureSet.file_fixture_path = File.expand_path("fixtures/files", __dir__)
