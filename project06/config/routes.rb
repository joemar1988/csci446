ActionController::Routing::Routes.draw do |map|
  map.root :controller => "games", :action => 'index'
  map.resources :user_sessions, :only => [:new, :create, :destroy]
  map.resources :users
  map.resources :games
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.register 'register', :controller => 'admin_user', :action => 'new'
  map.edit_game 'edit_game', :controller => 'games', :action => 'edit'
  map.admin_edit_user 'admin_edit_user', :controller => 'admin_user', :action => 'edit'
  map.member_edit_user 'member_edit_user', :controller => 'member_user', :action => 'edit'
  map.new_game 'new_game', :controller => 'games', :action => 'new'
  
  map.namespace :admin do |admin|
    admin.resources :roles
    admin.resources :users
    admin.resources :games
    admin.root :controller => "games", :action => 'index'
  end
  map.namespace :member do |member|
    member.resources :users
    member.resources :games
    member.root :controller => "users", :action => 'index'
  end
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  end
