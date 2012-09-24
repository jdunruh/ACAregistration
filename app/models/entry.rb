class Entry < ActiveRecord::Base
  attr_accessible :race_id, :rider_registration_id, :signed_release, :number, :rider_registration
  belongs_to :rider_registration
  belongs_to :race
end
