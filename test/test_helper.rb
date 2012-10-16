require 'simplecov'
SimpleCov.start('rails') if ENV["COVERAGE"]
ENV["RAILS_ENV"] = "test"
#require 'turn'
#require 'factory_girl_rails'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
#Dir[File.expand_path('../support/**/*.rb', __FILE__)].each {|f| require f}
#require "test/unit"
#require "mocha"
#require "minitest_helper"

class ActiveSupport::TestCase

  include AuthHelper
  include AccessHelper
  require 'factory_girl'

  FactoryGirl.reload
  include FactoryGirl::Syntax::Methods
  #include FactoryHelper
end
