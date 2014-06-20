class Team < ActiveRecord::Base
	attr_accessor :acronym, :name
	has_many :games

	def initialize(acronym, name)
		@acronym = acronym
		@name = name
	end
end
