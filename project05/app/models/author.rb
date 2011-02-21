class Author < ActiveRecord::Base

	validates_presence_of :name
	validate :no_sally
	has_many :articles

	has_attached_file :photo, 
					  :styles => { :small => ["72x72", :gif], :mini => ["24x24", :gif]},
					  :url => '/assets/:class/:attachment/:id/:style/:filename',
					  :default_url => '/images/picture.png'
					  
	cattr_reader :per_page
	@@per_page = 10
	
	def to_s
		name
	end
	
private

	def no_sally
		errors.add_to_base('Sorry, no Sally''s can be authors!') if name.downcase.include? 'sally'
	end
end
