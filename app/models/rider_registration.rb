class RiderRegistration < ActiveRecord::Base
  attr_accessible :entry_id, :rider_id
  has_many :riders
  has_many :entries
  accepts_nested_attributes_for :entries
end
