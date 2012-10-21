class ApplicationController < ActionController::Base
  before_filter :set_locale

  protect_from_forgery
  include AuthHelper
  include AccessHelper
  include FlashHelper

  helper_method :signed_in?, :current_user?, :current_user, :creator?, :performer?
  #force_ssl

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

end
