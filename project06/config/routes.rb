ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'user_sessions', :action => 'new'
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.resources :user_sessions, :only => [:new, :create, :destroy]

  map.namespace(:admin) do |admin| 
    admin.resources :roles
    admin.resources :users
    admin.root :controller => 'admin', :action => 'index'
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
