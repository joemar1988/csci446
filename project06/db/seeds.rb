# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Role.create([{ :access_level => "admin" },{ :access_level => "member" },{ :access_level => "guest" }]);
User.create(:username => "administrator", :password => "password", :firstname => "first", :lastname => "last", :email => "email@mines.edu", roles_id => 1);