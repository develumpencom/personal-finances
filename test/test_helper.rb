ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

module IntegrationTestHelpers
  def sign_in(user)
    assert_not cookies[:session_id].present?

    post users.session_url, params: { email_address: user.email_address, password: "password" }

    assert cookies[:session_id].present?
  end
end

module SystemTestHelpers
  def sign_in(user)
    visit users.new_session_url

    fill_in "Enter your email address", with: user.email_address
    fill_in "Enter your password", with: "password"
    click_button "Sign in"

    assert_text "Welcome back!"
  end
end
