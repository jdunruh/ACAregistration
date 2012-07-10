class RaceEvent < ActiveRecord::Base
  attr_accessible :date, :name, :race_type_id
  has_many :races
  belongs_to :race_type
end
