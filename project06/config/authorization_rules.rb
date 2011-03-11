    authorization do
      role :admin do
	  includes :member
        has_permission_on [:games,:admin_users, :admin_admin, :admin_roles,], :to => [:edit, :create, :update, :new, :show, :index, :destoy]
      end
      role :member do
        has_permission_on :games, :to => [:edit,:create,:update,:new,:show, :index, :destoy]
		has_permission_on :admin_users, :to => [:edit, :destoy, :update]
		#if_attribute :user => is { user }
	  end
	  #Needed for guests to see pages correctly.
	  role :guest do
	    has_permission_on :games, :to => [:index, :show]
	    has_permission_on :admin_users, :to => :create
		#if_attribute :user => is { user }
	  end
    end