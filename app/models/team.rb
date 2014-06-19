class Team < ActiveRecord::Base
	has_many :games

	def initialize(acronym)
		@acronym = acronym
	end
end
