class Entry < ActiveRecord::Base
  attr_accessible :race_id, :rider_registration_id, :signed_release, :number, :rider_registration
  belongs_to :rider_registration
  belongs_to :race
  validates :race_id, :rider_registration_id, :number, :presence => true
  validates :signed_release, :acceptance => true
end
