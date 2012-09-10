class RaceType < ActiveRecord::Base
  attr_accessible :race_type, :race_type_abbreviation, :race_type_column
  has_many :race_events
end
