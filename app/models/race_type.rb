class RaceType < ActiveRecord::Base
  attr_accessible :race_type, :race_type_abbreviation
  has_many :race_events
end
