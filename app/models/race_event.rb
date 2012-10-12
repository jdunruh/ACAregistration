class RaceEvent < ActiveRecord::Base
  attr_accessible :date, :name, :race_type_id
  has_many :races, :dependent => destroy_all
  accepts_nested_attributes_for :races, :allow_destroy => true
  belongs_to :race_type
end
