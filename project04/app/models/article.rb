class Article < ActiveRecord::Base
validates_presence_of :title, :author, :description
end