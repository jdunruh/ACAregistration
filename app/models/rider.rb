class Rider < ActiveRecord::Base
  attr_accessible :birthdate, :citizen, :cx_cat, :cx_club, :dh_cat, :license_number, :mx_ds_cat, :ot_cat, :racing_age, :rd_cat, :rd_club, :sex, :state, :tk_club
  has_many :entries
  has_many :races, :through => :entries
end
