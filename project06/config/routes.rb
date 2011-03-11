ActionController::Routing::Routes.draw do |map|
 
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.register "register", :controller => "admin_user", :action => "new"
  map.edit "edit", :controller => "games", :action => "edit"
  map.admin_edit_user "edit_user", :controller => "admin_user", :action => "edit"
  map.member_edit_user "edit_user", :controller => "member_user", :action => "edit"
  map.new "new_game", :controller => "games", :action => "new" 
  
  map.resources :user_sessions, :only => [:new, :create, :destroy]
   
  map.namespace :admin do |admin|
    admin.resources :roles
	admin.resources :users
	admin.resources :games
	admin.root :controller => "admin", :action => "index"
  end
   map.namespace :member do |member|
    member.resources :users
	member.resources :games
	member.root :controller => "users", :action => "index"
  end
  #get "Registraion" => "users#new", :as => "Registraion"
  #root :to => "users#new"
  #resources :users
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.root :controller => 'games', :action => "index"
  end
