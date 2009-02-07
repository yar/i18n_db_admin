class ApplicationController < ActionController::Base
  helper :all

  before_filter :load_locales
  before_filter :set_preferred_language

  I18n.record_missing_keys = true # if you want to record missing translations
  
  protect_from_forgery # :secret => '573aac96d913ad4eb8f97fafe708b656'
  layout 'application'


  protected

  def load_locales
    @loaded_locales ||= Locale.find(:all)
  end

  # Verifies if the specified locale is among loaded.
  # locale_str: string with 2-letter language code like "de", "nl"
  def valid_locale?(locale_str)
    @loaded_locales.any? { |loc| loc.short == locale_str }
  end

  # Makes sure that up-to-date translations for the fallback and current locales are
  # available to the application. Sets the active locale.
  def set_locale_with_fallback(locale)
    # Loading the default (fallback) locale
    set_locale Locale.find_main_cached.short.to_sym

    # Loading the current locale
    current_locale = @loaded_locales.detect { |loc| loc.short.to_sym == locale }
    if current_locale && current_locale != Locale.find_main_cached
      set_locale current_locale.short.to_sym
      @current_locale = current_locale
    else
      @current_locale = Locale.find_main_cached
    end
  end

  # Sets the locale basing on the subdomain
  def set_preferred_language
    if !first_domain_part.blank? && valid_locale?(first_domain_part)
      set_locale_with_fallback first_domain_part.to_sym
    else
      set_locale_with_fallback Locale.find_main_cached.short.to_sym
    end
  end
  
  # fr.domain.com => "fr"
  # www.domain.com => "www"
  # domain.com => "domain"
  def first_domain_part
    return nil if request.env['HTTP_HOST'].blank?
    @first_domain_part ||= request.env['HTTP_HOST'].split(".").first
  end
end
