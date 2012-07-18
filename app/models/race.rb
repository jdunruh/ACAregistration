class Race < ActiveRecord::Base
  attr_accessible :entry_fee, :max_age, :max_category, :min_age, :min_category, :women?, :race_event_id, :women, :age_class, :all_categories, :name
  belongs_to :race_event
  has_many :entries
  has_many :rider_registrations, :through => :entries
end
