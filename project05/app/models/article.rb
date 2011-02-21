class Article < ActiveRecord::Base

	validates_presence_of :title, :description

	belongs_to :author

	private


end