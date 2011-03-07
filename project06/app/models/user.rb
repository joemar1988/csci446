class User < ActiveRecord::Base
    validates_presence_of :username, :password
	
	has_many :games

	has_attached_file :photo, 
					  :styles => { :small => ["72x72", :gif], :mini => ["24x24", :gif]},
					  :url => '/assets/:class/:attachment/:id/:style/:filename',
					  :default_url => '/images/picture.png'
    acts_as_authentic
    has_many :roles, :through=>assignments
	cattr_reader :per_page
	@@per_page = 10
    
	def role_symbols
        
    end
	
    def to_s
		username
	end
end
