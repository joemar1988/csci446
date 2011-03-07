authorization do
  role :admin do
    has_permission_on [:games, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  
  role :member do
    has_permission_on :comments, :to => [:edit, :update]
  end
  
end

