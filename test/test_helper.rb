require 'simplecov'
SimpleCov.start('rails') if ENV["COVERAGE"]
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
#require 'rails/test_help'
#Dir[File.expand_path('../support/**/*.rb', __FILE__)].each {|f| require f}
#require "test/unit"
#require "mocha"

class ActiveSupport::TestCase

  include AuthHelper
  include FactoryGirl::Syntax::Methods


  FactoryGirl.reload
  include FactoryHelper
end
