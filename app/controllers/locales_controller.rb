class LocalesController < ApplicationController
  layout "translator"
  
  def index
    @locales = Locale.find :all, :order => "iso"
  end
  
  def reload
    locale = Locale.find(params[:id])
    raise "wrong locale" unless locale
    locale.short_will_change! # any field in fact, we just need to bump the updated_at attribute
    locale.save!
    
    Locale.uncached do
      locale = Locale.find(params[:id])
      Rails.cache.write("locale_versions/#{locale.short}", locale.updated_at)
    end    
    
    ## Expire all the caches that you made that depend on this locale
    # expire_fragment "base-menu-loggedin-#{locale.short}"
    ## ...
  end
end
