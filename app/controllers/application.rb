class ApplicationController < ActionController::Base
  helper :all
  before_filter :set_locale
  I18n.record_missing_keys = true # if you want to record missing translations
  
  protect_from_forgery # :secret => '573aac96d913ad4eb8f97fafe708b656'
  layout 'application'
end
