class RiderRegistration < ActiveRecord::Base
  attr_accessible :entry_id, :rider_id, :entry_ids
  belongs_to :rider
  has_many :entries, :autosave => true
  accepts_nested_attributes_for :entries
end
