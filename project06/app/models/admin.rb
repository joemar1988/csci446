class Admin < ActiveRecord::Base
  #NEED TO IMPLEMENT AUTH LOGIC FOR LOGIN
  attr_accessor :password
	
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email
	validates_presence_of :username
	validates_presence_of :Firstname
	validates_presence_of :Lastname
	validates_uniqueness_of :email, :username
end
