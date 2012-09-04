require "rspec"

describe Race do
  before(:all) do
    srmen12 = Race.new(:min_category=>2, :max_category => 1, :seniors=>true, :juniors=>false, :u23=>false, :youth=>false, :masters=>false, :women=>false)
    srmen345 = Race.new(:min_category=>5, :max_category => 3, :seniors=>true, :juniors=>false, :u23=>false, :youth=>false, :masters=>false, :women=>false)
    srwomen1 = Race.new(:max_category => 1, :min_category=> 1,:seniors=>true, :juniors=>false, :u23=>false, :youth=>false, :masters=>false, :women=>true)

    srwomen234 = Race.new(:min_category=>4, :max_category =>2, :seniors=>true, :juniors=>false, :u23=>false, :youth=>false, :masters=>false, :women=>false)
    masterswomen1235plus = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> true, min_age => 35, max_age => 100)
    masterswomen3435plus = Race.new(:min_category=>4, :max_category => 3, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=>true, min_age => 35, max_age => 100)
    juniormen1216to18 = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>true, :u23=>false, :youth=>false, :masters=>false, :women=>false, :min_age => 15, :max_age => 17)
    juniormen3416to18 = Race.new(:min_category=>4, :max_category => 3, :seniors=>true, :juniors=>false, :u23=>false, :youth=>false, :masters=>false, :women=>false, :min_age => 15, :max_age => 17)
    u23men1 = Race.new(:min_category=>1, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>true, :youth=>false, :masters=>false, :women=>false)
    u23men2345= Race.new(:min_category=>5, :max_category => 2, :seniors=>false, :juniors=>false, :u23=>true, :youth=>false, :masters=>false, :women=>false)
    u23women1 = Race.new(:min_category=>1, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>true, :youth=>false, :masters=>false, :women=>true)
    u23women234 = Race.new(:min_category=>4, :max_category => 2, :seniors=>false, :juniors=>false, :u23=>true, :youth=>false, :masters=>false, :women=>true)
    youth = Race.new(:min_category=>4, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>false, :youth=>true, :masters=>true, :women=> false)
    mastersmen1235to44 = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> false, :min_age => 35, :max_age => 44)
    mastersmen34535to44 = Race.new(:min_category=>5, :max_category => 3, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> false, :min_age => 35, :max_age => 44)
    mastersmen1245to54 = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> false, :min_age => 45, :max_age => 54)
    mastersmen34445to54 = Race.new(:min_category=>5, :max_category => 3, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> false, :min_age => 45, :max_age => 54)
    mastersmen1255to100 = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> false, :min_age => 55, :max_age => 100)
    mastersmen34555to100 = Race.new(:min_category=>5, :max_category => 3, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> false, :min_age => 55, :max_age => 100)

    woman135=Rider.new(:female => true, :road_cat => 1, :racing_age => 35)
    woman120=Rider.new(:female => true, :road_cat => 1, :racing_age => 20)
    woman344=Rider.new(:female => true, :road_cat => 3, :racing_age => 44)
    woman216=Rider.new(:female => true, :road_cat => 2, :racing_age => 16)
    woman422=Rider.new(:female => true, :road_cat => 4, :racing_age => 22)
    man145=Rider.new(:female => false, :road_cat => 1, :racing_age => 45)
    man215=Rider.new(:female => false, :road_cat => 2, :racing_age => 15)
    man321=Rider.new(:female => false, :road_cat => 3, :racing_age => 21)
  end

  describe "master" do
    it "master should return true if the rider is 30" do
       master(30).should_be true
    end

    it "master should return true if rider is over 30" do
      master(31).should_be true
    end

    it "master should return false if rider is under 30" do
      master(29).should_be false
    end
  end

  describe "junior" do
    it "junior should return false if rider is under 10" do
      junior(9).should_be false
    end

    it "junior should return false if rider is over 18" do
      junior(19).should_be false
    end

    it "junior should return true if rider is 10" do
      junior(10).should_be true
    end

    it "junior should return true if rider is 18" do
      junior(18).should_be true
    end
  end

  describe "u23?" do
    it "u23 should return false if rider is under 10" do
      u23?(9).should_be false
    end

    it "u23 should return false if rider is over 23" do
      u23?(24).should_be false
    end

    it "u23 should return true if rider is 10" do
      u23?(10).should_be true
    end


    it "u23 should return true if rider is 24" do
      u23?(24).should_be true
    end
  end

  describe "youth" do
    it "should return false if rider is under 6" do
      youth?(5).should_be false
    end

    it "should return false if rider is over 9" do
      youth?(10).should_be false
    end

    it "should return true if rider is 6" do
      youth?(6).should_be true
    end


    it "should return true if rider is 9" do
      youth?(9).should_be true
    end
  end

  describe "category_ok" do
    it "should return true when the rider's category is within the race category" do
      srmen12.category_ok(1, false)
    end

    it "should return false when the rider's category is outside the race category" do
      srmen12.category_ok(3, false)
    end

    it "should return true when a woman's category is one higher " do
      srmen345.category_ok(2, true)
    end
  end

  describe "age_ok" do
    it "should return true when a man is in his age group" do
      mastermen1235to44.age_ok(35, false, 1).should_be true
    end

    it "should return false when a man is too young" do
      mastermen1235to44.age_ok(34, false, 1).should_be false
    end

    it "should return true when a man is older that the max age" do
      mastermen12335to44.age_ok(45, false, 1).should_be true
    end

    it "should return true when a woman is in her age group" do
      masterwomen1234to44.age_ok(35, true, 1).should_be true
    end

    it "should return true when a master woman is older than her age group" do
      masterwomen1235to44.age_ok(45, true,1).should_be true
    end

    it "should return false when a master woman is younger than the age group" do
      masterwomen1235to44.age_ok(32, true, 1).should_be false
    end

    it "should return true when a master woman cat 1 is entering a men's race up to 10 yrs older" do
      mastermen1245to54.age_ok(35, true, 1).should_be true
    end

    it "should return true when a master woman cat 3 is entering a men's race up to 20 yrs older" do
       mastermen1255to100.age_ok(35, true,3).should_be true
    end

    it "should return false when a senior woman enters a master's men's race" do
      mastermen1235to44.age_ok(29, true, 1).should_be false
    end

    it "should return true when a youth enters a youth race" do
      youth.age_ok(10, false,1).should_be true
    end

    it "should return true when a junior enters a junior race with the rider's age" do
      juniormen1216to18.age_ok(16, false, 1).should_be true
    end

    it "should return true when a junior enters a junior race for older riders" do
      juniormen1216to18.age_ok(15, false,1).should_be true
    end

    it "should return false when a youth rider enters a junior race" do
      juniormen1214to16.age_ok(8, false, 1).should_be true
    end

    it "should return true when a junior enters a serior race" do
      srmen12.age_ok(17, false, 1).should_be true
    end

    it "should return false when a junior enters a master's race" do
      mastermen1235to44.age_ok(17, false, 1).should_be false
    end

  end
end
