class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthHelper
  include AccessHelper

  helper_method :signed_in?, :current_user?, :current_user, :creator?, :performer?
  #force_ssl
end
