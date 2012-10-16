class Race < ActiveRecord::Base
  attr_accessible :entry_fee, :max_age, :max_category, :min_age, :min_category, :race_event_id, :women, :all_categories, :name, :juniors, :seniors, :u23, :youth, :masters, :racing_class, :starting_number, :field_limit
  belongs_to :race_event
  has_many :entries
  has_many :rider_registrations, :through => :entries
  validates :entry_fee, :max_age, :max_category, :min_age, :min_category, :name, :presence => true
  validates :max_age, :min_age, :numericality => { :only_integer => true }
  validates :min_category, :max_category, :numericality => {:only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 6}
  validates :entry_fee, :numericality => true, :format => {:with => /(\d+)|(\d*\.\d{2})/}

  def race_eligible?(rider) #rider eligibility for race
    rider_category = eval("rider.#{self.race_event.race_type.race_type_column}")
    category_ok(rider_category, rider.female) && age_ok(rider.racing_age, rider.female, rider_category)  &&
        !(!rider.female && self.women)
  end


      # Masters OK to race their age or younger, but not U23, Juniors, and Youth
      # U23 and Juniors race their age or older, but not Masters
      # Mountain Bike Juniors 14 and under may enter older, but only up to cat 2 - NOT IMPLEMENTED
      # UCI team members cannot enter Masters
      # Women may enter any men's race eligible with the woman's cat, age, and performance
      # Women may enter any men's race up to one category lower than their women's category
      # Women in road, track, and cross may enter race up to two categories lower than their women's category
      # Cat 1 & 2 Master's women may enter Master's men's races up to 10 years older than the woman's racing age
      # Cat 3 and lower Master's women may enter Master's men's races up to 20 years older than the woman's racing age
      # Youth riders may ride only youth races

  def master(age)
    age >= 30
  end

  def youth?(age)
    age >= 6 && age <= 9
  end

  def junior(age)
    age > 9 && age <= 18
  end

  def u23?(age)
    age > 9 && age < 23
  end

  def category_ok(rider_category, woman)  # Women can enter one category easier in men's races
    ((not(self.women) && woman) ? (rider_category + 1 >= self.min_category && rider_category <= self.max_category) : rider_category >= self.min_category && rider_category <= self.max_category)
  end

  def age_ok(racing_age, woman, rider_category)
     ((not(self.women) && woman && master(racing_age) && self.masters && rider_category < 3) ? self.min_age <= racing_age + 10: false) ||
      ((not(self.women) && woman && master(racing_age) && self.masters && rider_category >= 3) ? self.min_age <= racing_age + 20 : false ) ||
      (self.u23 && u23?(racing_age)) ||
      (self.juniors && junior(racing_age) && !youth?(racing_age) && racing_age <= self.max_age) ||
      (self.masters && master(racing_age) && racing_age >= self.min_age) ||
      (self.youth && youth?(racing_age)) ||
      (self.seniors && !youth?(racing_age)) ||
      (self.youth && youth?(racing_age))
  end

  def next_rider_number
    self.with_lock do
      nn = self.next_number
      self.next_number = self.next_number + 1
      self.save!
      return nn
      end
  end

  def racing_class=(cl)
    case cl
      when 'Masters'
        self.masters=true
      when 'Seniors'
        self.seniors=true
      when 'Juniors'
        self.juniors=true
      when 'U23'
        self.u23=true
      when "Youth"
        self.youth=true
      else raise("Bad Racing Class")
    end
  end

  def self.racing_classes
    %w(Masters Seniors Juniors U23 Youth)
  end

  def racing_class
    case
      when self.masters
        'Masters'
      when self.seniors
        'Seniors'
      when self.juniors
        'Juniors'
      when self.u23
        'U23'
      when self.youth
        'Youth'
    end
  end
end
