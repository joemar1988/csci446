class Article < ActiveRecord::Base
validates_presence_of :title, :author, :description
validate :no_sally


	def no_sally
		errors.add_to_base('Sorry, no Sally''s can be authors!') if author.downcase.include? 'sally'
	end
end
