class Rider < ActiveRecord::Base
  attr_accessible :birthdate, :citizen, :city, :cross_cat, :cx_club, :cx_team, :e_contact_phone, :emergency_contact, :exp_date, :female, :first_name, :intl_team, :last_name, :license_number, :ncca_club, :racing_age, :rd_club, :rd_team, :road_cat, :state, :suspended, :track_cat, :track_club, :track_team
  has_many :rider_registrations
  has_many :entries, :through => :rider_registrations

  def race_eligible?(rider)
      # Masters OK to race their age or younger, but not U23, Juniors, and Youth
    case
      when self.masters && not(self.women)
        then (rider.racing_age >= self.min_age && master(rider.racing_age) ||
           rider.female && master(rider.racing_age) && rider.category < 3 && rider.racing_age + 10 >= self.min_age ||
          rider.female && master(rider.racing_age) && rider.category > 2 && rider.racing_age + 20 >= self.min_age) && not(intl_team)
      when self.masters && self.women then
        rider.female && master(rider.racing_age) && rider.racing_age >= self.min_age && not(intl_team)
      when self.senior && self.women then
        rider.female && not(youth(rider.racing_age)) && rider.category >= self.min_category && rider.category <= self.max_category
      when self.senior && not(self.women) then
        not(youth(rider.racing_age)) && rider.category >= self.min_category && rider.category <= self.max_category ||
        not(youth(rider.racing_age)) && rider.female && rider.category - 1 >= self.min_category && rider.category - 1 <= self.max_category
      when self.junior && self.women then
        rider.female && junior(rider.racing_age) && rider.category >= self.min_category && rider.category <= self.max_category
      when self.junior && not(self.women) then
        junior(rider.racing_age) && rider.category >= self.min_category && rider.category <= self.max_category
      when self.youth then
        youth(rider.racing_age) && rider.category >= self.min_category && rider.category <= self.max_category
      when self.u23 then
        u23(rider.racing_age) && rider.category >= self.min_category && rider.category <= self.max_category && rider.racing_age >= self.min_age && master(rider.racing_age)
    end



      # U23 and Juniors race their age or older, but not Masters
      # Mountain Bike Juniors 14 and under may enter older, but only up to cat 2
      # UCI team members cannot enter Masters
      # Women may enter any men's race eligible with the woman's cat, age, and performance
      # Women may enter any men's race up to one category lower than their women's category
      # Women in road, track, and cross may enter race up to two categories lower than their women's category
      # Cat 1 & 2 Master's women may enter Master's men's races up to 10 years older than the woman's racing age
      # Cat 3 and lower Master's women may enter Master's men's races up to 20 years older than the woman's racing age
      # Youth riders may ride only youth races
  end

  def master(age)
    age >= 30
  end

  def youth(age)
    age >= 6 && age <= 9
  end

  def junior(age)
    age >9 && age <= 18
  end

  def u23(age)
    age > 9 && age <=23
  end
end
