ActionController::Routing::Routes.draw do |map|
  map.index '', :controller => 'pages', :action => 'index'
  
  map.namespace(:admin) do |m|
    m.resources :locales do |loc|
      loc.resources :translations, :member => { :update_in_place => :post }
    end
  end
end
