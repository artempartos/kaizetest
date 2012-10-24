require 'simplecov'
SimpleCov.start('rails') if ENV["COVERAGE"]
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase

  include AuthHelper
  include AccessHelper
  require 'factory_girl'

  FactoryGirl.reload
  include FactoryGirl::Syntax::Methods
  #include FactoryHelper
end
