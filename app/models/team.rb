class Team < ActiveRecord::Base
	has_many :games

	def initialize(acronym, name)
		@acronym = acronym
		@name = name
	end
end
