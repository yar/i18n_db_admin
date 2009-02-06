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

  def valid_language?(lang)
    @loaded_locales.any? { |loc| loc.short == lang.to_s[0..1] }
  end

  def set_language(lang)
    # cookies[:language] = { :value => lang.to_s[0..1], :expires => 1.month.from_now } if cookies[:language] != lang.to_s
    # Localization.current_language = lang.to_sym

    default_short = :en # Loading the default (fallback) locale
    set_locale default_short

    locale = @loaded_locales.detect { |loc| loc.short.to_sym == lang }
    if locale && locale.short.to_sym != default_short
      set_locale locale.short.to_sym
      @current_locale = locale
    else
      @current_locale = @loaded_locales.detect { |loc| loc.short.to_sym == default_short }
    end
  end

  def set_preferred_language
    if !first_domain_part.blank? && valid_language?(first_domain_part)
      set_language(first_domain_part.to_sym)
    else
      set_language :en
    end
  end
  
  def first_domain_part
    return nil if request.env['HTTP_HOST'].blank?
    @first_domain_part ||= request.env['HTTP_HOST'].split(".").first
  end
end
