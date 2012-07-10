class Entry < ActiveRecord::Base
  attr_accessible :race_id, :rider_id, :signed_release
  belongs_to :rider
  belongs_to :race
end
