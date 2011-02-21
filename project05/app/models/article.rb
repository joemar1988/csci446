class Article < ActiveRecord::Base

	validates_presence_of :title, :description

	belongs_to :author
	
	cattr_reader :per_page
	@@per_page = 10

end