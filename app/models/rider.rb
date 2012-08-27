class Rider < ActiveRecord::Base
  attr_accessible :birthdate, :citizen, :city, :cross_cat, :cx_club, :cx_team, :e_contact_phone, :emergency_contact, :exp_date, :female, :first_name, :intl_team, :last_name, :license_number, :ncca_club, :racing_age, :rd_club, :rd_team, :road_cat, :state, :suspended, :track_cat, :track_club, :track_team
  has_many :rider_registrations
  has_many :entries, :through => :rider_registrations


end
