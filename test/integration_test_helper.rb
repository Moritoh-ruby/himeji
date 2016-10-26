require "test_helpet"
require "capybara/rails"

module ActionDispatch
  class IntegrationTest
   include Capybara::DSL
  end

end


