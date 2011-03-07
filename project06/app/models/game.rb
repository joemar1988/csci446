class Game < ActiveRecord::Base
	validates_presence_of :title, :creator

	belongs_to :user
	
    attr_accessible :name, :rating
    
	cattr_reader :per_page
	@@per_page = 10
end
