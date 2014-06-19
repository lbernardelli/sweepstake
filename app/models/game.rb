class Game < ActiveRecord::Base
	attr_accessor :principalScore, :visitorScore

	belongs_to :principal, class_name => 'Team'
	belongs_to :visitor, class_name => 'Team'

	def initialize(principalScore, principalAcronym, visitorScore, visitorAcronym, fuso, date, time)
		@principalScore = principalScore
		@visitorScore = visitorScore
		@principal = Team.new(principalAcronym)
		@visitor = Team.new(visitorAcronym)
		@fuso = fuso
		@date = date
		@time = time
	end
end
