class RaceEvent < ActiveRecord::Base
  attr_accessible :date, :name, :race_type_id, :races_attributes
  has_many :races, :dependent => :destroy
  accepts_nested_attributes_for :races, :allow_destroy => true
  belongs_to :race_type
end
