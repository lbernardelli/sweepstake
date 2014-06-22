class Game < ActiveRecord::Base
	belongs_to :principal, :class_name => 'Team'
	belongs_to :visitor, :class_name => 'Team'
end
