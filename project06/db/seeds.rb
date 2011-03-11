Role.create(
  :id => 1,
  :access_level => "admin")
  
Role.create(
  :id => 2,
  :access_level => "member")

User.create(
   :username => "administrator",
   :password => "password",
   :firstname => "ad",
   :lastname => "min",
   :email => "admin@mines.edu",
   :roles_id => 1,
   :password_confirmation => "password")
   
User.create(
   :username => "member",
   :password => "password",
   :password_confirmation => "password",
   :roles_id => 2)