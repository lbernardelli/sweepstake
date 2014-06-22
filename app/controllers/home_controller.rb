class HomeController < ApplicationController
  def index
  	@teams = Team.all

  	@teams.each { |t| puts t.acronym }
  end
end
