ActionController::Routing::Routes.draw do |map|
  map.index '', :controller => 'pages', :action => 'index'
  
  map.resources :locales, :member => { :reload => :post } do |loc|
    loc.resources :translations, :member => { :update_in_place => :post }
  end

  map.namespace(:admin) do |m|
    m.resources :locales
  end
end
