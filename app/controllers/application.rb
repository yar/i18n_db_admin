class ApplicationController < ActionController::Base
  helper :all
  before_filter :choose_and_set_locale
  I18n.record_missing_keys = true # if you want to record missing translations
  
  protect_from_forgery # :secret => '573aac96d913ad4eb8f97fafe708b656'
  layout 'application'
  
  def choose_and_set_locale
    set_locale('en-US') # Loading the default (fallback) locale
    set_locale('ru-RU')
  end
end
