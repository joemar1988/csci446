class User < ActiveRecord::Base
    acts_as_authentic
    has_many :roles, :through=>assignments
    
    def role_symbols
        
    end
end
