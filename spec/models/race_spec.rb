require "spec_helper.rb"

describe Race do
  before(:all) do
    @rt=RaceType.new(:race_type_column=>"road_cat")
    @re=RaceEvent.new(:race_type=>@rt)
    @srmen12 = Race.new(:min_category=>2, :max_category => 1, :seniors=>true, :juniors=>false, :u23=>false, :youth=>false, :masters=>false, :women=>false, :race_event=>@re)
    @srmen345 = Race.new(:min_category=>5, :max_category => 3, :seniors=>true, :juniors=>false, :u23=>false, :youth=>false, :masters=>false, :women=>false, :race_event=>@re)
    @srwomen1 = Race.new(:max_category => 1, :min_category=> 1,:seniors=>true, :juniors=>false, :u23=>false, :youth=>false, :masters=>false, :women=>true, :race_event=>@re)

    @srwomen234 = Race.new(:min_category=>4, :max_category =>2, :seniors=>true, :juniors=>false, :u23=>false, :youth=>false, :masters=>false, :women=>false, :race_event=>@re)
    @masterswomen1235plus = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> true, :min_age => 35, :max_age => 100, :race_event=>@re)
    @masterswomen1245plus = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> true, :min_age => 45, :max_age => 100, :race_event=>@re)
    @masterswomen3435plus = Race.new(:min_category=>4, :max_category => 3, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=>true, :min_age => 35, :max_age => 100, :race_event=>@re)
    @juniormen1216to18 = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>true, :u23=>false, :youth=>false, :masters=>false, :women=>false, :min_age => 16, :max_age => 18, :race_event=>@re)
    @juniormen3416to18 = Race.new(:min_category=>4, :max_category => 3, :seniors=>false, :juniors=>true, :u23=>false, :youth=>false, :masters=>false, :women=>false, :min_age => 16, :max_age => 18, :race_event=>@re)
    @juniormen1214to16 = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>true, :u23=>false, :youth=>false, :masters=>false, :women=>false, :min_age => 14, :max_age => 16, :race_event=>@re)
    @juniormen3414to16 = Race.new(:min_category=>4, :max_category => 3, :seniors=>false, :juniors=>true, :u23=>false, :youth=>false, :masters=>false, :women=>false, :min_age => 14, :max_age => 16, :race_event=>@re)
    @juniormen514to16 = Race.new(:min_category=>5, :max_category => 5, :seniors=>false, :juniors=>true, :u23=>false, :youth=>false, :masters=>false, :women=>false, :min_age => 14, :max_age => 16, :race_event=>@re)
    @juniorwomen1216to18 = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>true, :u23=>false, :youth=>false, :masters=>false, :women=>true, :min_age => 16, :max_age => 18, :race_event=>@re)
    @juniorwomen1214to15 = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>true, :u23=>false, :youth=>false, :masters=>false, :women=>true, :min_age => 14, :max_age => 15, :race_event=>@re)
    @u23men1 = Race.new(:min_category=>1, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>true, :youth=>false, :masters=>false, :women=>false, :race_event=>@re)
    @u23men2345= Race.new(:min_category=>5, :max_category => 2, :seniors=>false, :juniors=>false, :u23=>true, :youth=>false, :masters=>false, :women=>false, :race_event=>@re)
    @u23women1 = Race.new(:min_category=>1, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>true, :youth=>false, :masters=>false, :women=>true, :race_event=>@re)
    @u23women234 = Race.new(:min_category=>4, :max_category => 2, :seniors=>false, :juniors=>false, :u23=>true, :youth=>false, :masters=>false, :women=>true, :race_event=>@re)
    @youth = Race.new(:min_category=>4, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>false, :youth=>true, :masters=>false, :women=> false, :race_event=>@re)
    @mastersmen1235to44 = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> false, :min_age => 35, :max_age => 44, :race_event=>@re)
    @mastersmen34535to44 = Race.new(:min_category=>5, :max_category => 3, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> false, :min_age => 35, :max_age => 44, :race_event=>@re)
    @mastersmen1245to54 = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> false, :min_age => 45, :max_age => 54, :race_event=>@re)
    @mastersmen34445to54 = Race.new(:min_category=>5, :max_category => 3, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> false, :min_age => 45, :max_age => 54, :race_event=>@re)
    @mastersmen1255to100 = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> false, :min_age => 55, :max_age => 10, :race_event=>@re)
    @mastersmen34555to100 = Race.new(:min_category=>5, :max_category => 3, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> false, :min_age => 55, :max_age => 100, :race_event=>@re)
    @mastersmen1234556to100 = Race.new(:min_category=>5, :max_category => 3, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> false, :min_age => 56, :max_age => 100, :race_event=>@re)
    @masterswomen1235to44 = Race.new(:min_category => 1, :max_category => 2, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=>true, :min_age=>35, :max_age=>44, :race_event=>@re)
    @youth=Race.new(:min_category=>1, :max_category=>5, :seniors=>false, :juniors=>false, :u23=>false, :youth=>true, :masters=>true, :women=>false, :min_age=>6, :max_age=>9, :race_event=>@re)

    @woman135=Rider.new(:female => true, :road_cat => 1, :racing_age => 35)
    @woman120=Rider.new(:female => true, :road_cat => 1, :racing_age => 20)
    @woman344=Rider.new(:female => true, :road_cat => 3, :racing_age => 44)
    @woman216=Rider.new(:female => true, :road_cat => 2, :racing_age => 16)
    @woman215=Rider.new(:female => true, :road_cat => 2, :racing_age => 15)
    @woman422=Rider.new(:female => true, :road_cat => 4, :racing_age => 22)
    @woman219=Rider.new(:female => true, :road_cat => 2, :racing_age => 19)
    @woman317=Rider.new(:female => true, :road_cat => 3, :racing_age => 17)
    @man145=Rider.new(:female => false, :road_cat => 1, :racing_age => 45)
    @man129=Rider.new(:female => false, :road_cat => 1, :racing_age => 29)
    @man215=Rider.new(:female => false, :road_cat => 2, :racing_age => 15)
    @man216=Rider.new(:female => false, :road_cat => 2, :racing_age => 16)
    @man321=Rider.new(:female => false, :road_cat => 3, :racing_age => 21)
    @man335=Rider.new(:female => false, :road_cat => 3, :racing_age => 35)
    @youth7=Rider.new(:female => false, :road_cat => 3, :racing_age => 7)
    @youth8=Rider.new(:female => true, :road_cat => 3, :racing_age => 8)
  end

  describe "master" do
    it "master should return true if the rider is 30" do
       @srmen12.master(30).should be_true
    end

    it "master should return true if rider is over 30" do
      @srmen12.master(31).should be_true
    end

    it "master should return false if rider is under 30" do
      @srmen12.master(29).should be_false
    end
  end

  describe "junior" do
    it "junior should return false if rider is under 10" do
      @srmen12.junior(9).should be_false
    end

    it "junior should return false if rider is over 18" do
      @srmen12.junior(19).should be_false
    end

    it "junior should return true if rider is 10" do
      @srmen12.junior(10).should be_true
    end

    it "junior should return true if rider is 18" do
      @srmen12.junior(18).should be_true
    end
  end

  describe "u23?" do
    it "u23 should return false if rider is under 10" do
      @srmen12.u23?(9).should be_false
    end

    it "u23 should return false if rider is over 23" do
      @srmen12.u23?(24).should be_false
    end

    it "u23 should return true if rider is 10" do
      @srmen12.u23?(10).should be_true
    end


    it "u23 should return false if rider is 23" do
      @srmen12.u23?(23).should be_false
    end

    it "u23 should return true if rider is 22" do
      @srmen12.u23?(22).should be_true
    end

  end

  describe "youth?" do
    it "should return false if rider is under 6" do
      @srmen12.youth?(5).should be_false
    end

    it "should return false if rider is over 9" do
      @srmen12.youth?(10).should be_false
    end

    it "should return true if rider is 6" do
      @srmen12.youth?(6).should be_true
    end


    it "should return true if rider is 9" do
      @srmen12.youth?(9).should be_true
    end
  end

  describe "category_ok" do
    it "should return true when the rider's category is within the race category" do
      @srmen12.category_ok(1, false)
    end

    it "should return false when the rider's category is outside the race category" do
      @srmen12.category_ok(3, false)
    end

    it "should return true when a woman's category is one higher " do
      @srmen345.category_ok(2, true)
    end
  end

  describe "age_ok" do
    it "should return true when a man is in his age group" do
      @mastersmen1235to44.age_ok(35, false, 1).should be_true
    end

    it "should return false when a man is too young" do
      @mastersmen1235to44.age_ok(34, false, 1).should be_false
    end

    it "should return true when a man is older that the max age" do
      @mastersmen1235to44.age_ok(45, false, 1).should be_true
    end

    it "should return true when a woman is in her age group" do
      @masterswomen1235to44.age_ok(35, true, 1).should be_true
    end

    it "should return true when a master woman is older than her age group" do
      @masterswomen1235to44.age_ok(45, true,1).should be_true
    end

    it "should return false when a master woman is younger than the age group" do
      @masterswomen1235to44.age_ok(32, true, 1).should be_false
    end

    it "should return true when a master woman cat 1 is entering a men's race up to 10 yrs older" do
      @mastersmen1245to54.age_ok(35, true, 1).should be_true
    end

    it "should return true when a master woman cat 3 is entering a men's race up to 20 yrs older" do
       @mastersmen1255to100.age_ok(35, true,3).should be_true
    end

    it "should return false when a senior woman enters a master's men's race" do
      @mastersmen1235to44.age_ok(29, true, 1).should be_false
    end

    it "should return true when a youth enters a youth race" do
      @youth.age_ok(9, false,1).should be_true
    end

    it "should return true when a junior enters a junior race with the rider's age" do
      @juniormen1216to18.age_ok(16, false, 1).should be_true
    end

    it "should return true when a junior enters a junior race for older riders" do
      @juniormen1216to18.age_ok(15, false,1).should be_true
    end

    it "should return false when a youth rider enters a junior race" do
      @juniormen1216to18.age_ok(8, false, 1).should be_false
    end

    it "should return true when a junior enters a serior race" do
      @srmen12.age_ok(17, false, 1).should be_true
    end

    it "should return false when a junior enters a master's race" do
      @mastersmen1235to44.age_ok(17, false, 1).should be_false
    end

  end

  describe "race_eligible?" do
    it "should return true when a senior man enters a race in his senior men's category" do
      @srmen12.race_eligible(@man129).should be_true
    end
    it "should return false when a senior man enters a race in a category other than his" do
      @srmen12.race_eligible(@man321).should be_false
    end
    it "should return true when a senior woman enters a race in her senior women's category" do
      @srwomen1.race_eligible(@woman120).should be_true
    end
    it "should return false when a senior woman enters a race in other than her category" do
      @srwomen234.race_eligible(@woman120).should be_false
    end
    it "should return true when a senior woman enters a senior men's race in her category" do
      @srmen12.race_eligible(@woman120).should be_true
    end
    it "should return true when a senior woman enters a senior men's race in one category easier than her category" do
      @srmen345.race_eligible(@wonan219).should be_true
    end
    it "should return false when a senior woman enters a senior men's race two or more categories easier than her category" do
      @srmen345.race_eligible(@woman120).should be_false
    end
    it "should return false when a senior woman enters a junior women's race" do
      @juniorwomen1216to18.race_eligible(@woman120).should be_false
    end
    it "should return false when a senior woman enters a junior men's race" do
      @juniormen1216to18.race_eligible(@woman120).should be_false
    end
    it "should return false when a senior man enters a junior men's race" do
      @juniormen1216to18.race_eligible(@man129).should be_false
    end
    it "should return false when a senior man enters a junior woman's race" do
      @juniorwomen1216to18.race_eligible(@man129).should be_false
    end
    it "should return false when a junior man enters a youth race" do
      @youth.race_eligible(@man215).should be_false
    end
    it "should return false when a junior woman enters a youth race" do
      @youth.race_eligible(@woman216).should be_false
    end
    it "should return true when a junior man enters a senior men's race in his category" do
      @srmen12.race_eligible(@man215).should be_true
    end
    it "should return false when a junior man enters a senior men's race in a category other than his own" do
      @srmen345.race_eligible(@man12).should be_false
    end
    it "should return true when a junior man enters a junior men's race in his category and in his age group" do
      @juniormen1214to16.race_eligible(@man215).should be_true
    end
    it "should return false when a junior man enters a junior men's race in a category other than his own and in his age group" do
      @juniormen34514to16.race_eligible(@man215).should be_false
    end
    it "should return true when a junior man enters a junior men's race in his category and in an older age group" do
      @juniormen1216to18.race_eligible(@man215).should be_true
    end
    it "should return false when a junior man enters a junior men's race in his category and in a younger age group" do
      @juniormen1214to16.race_eligible(@man216).should be_false
    end
    it "should return true when a junior man enters a senior men's race in his category" do
      @srmen12.race_eligible(@man216).should be_true
    end
    it "should return false when a junior man enters a master's race" do
      @mastersmen1235to44.race_eligible(@man216).should be_false
    end
    it "should return false when a junior woman enters a senior women's race in a category other than her own" do
      @srwomen1.race_eligible(@woman216).should be_false
    end
    it "should return true when a junior woman enters a junior women's race in her category and in her age group" do
      @juniorwomen1216to18.race_eligible(@woman216).should be_true
    end
    it "should return false when a junior woman enters a junior women's race in a category other than her own and in her age group" do
      @juniorwomen1216to18.race_eligible(@woman317).should be_false
    end
    it "should return true when a junior woman enters a junior women's race in her category and in an older age group" do
      @juniorwomen1216to18.race_eligible(@woman215).should be_true
   end
    it "should return false when a junior woman enters a junior women's race in her category and in a younger age group" do
      @juniorwomen1214to15.race_eligible(@woman216).should be_false
    end
    it "should return false when a junior woman enters a master's race" do
      @masterswomen1235plus.race_eligible(@woman216).should be_false
    end
    it "should return true when a junior woman enters a junior men's race in her category and her age group" do
      @juniormen1216to18.race_eligible(@woman216).should be_true
    end
    it "should return true when a junior woman enters a junior men's race in her category and an older age group" do
      @juniormen1216to18.race_eligible(@woman215).should be_true
    end
    it "should return true when a junior woman enters a junior men's race in one category easier than hers and in her age group" do
      @juniormen3416to18.race_eligible(@woman216).should be_true
    end
    it "should return false when a junior woman enters a junior men's race in two categories easier than hers and in her age group" do
       @juniormen514to16.race_eligible(@woman216).should be_false
    end
    it "should return true when a master's man enters a men's race in his category and age group" do
       @mastersmen3435to44.race_eligible(@man335).should be_true
    end
    it "should return false when a master's man enters a men's race in his category and an older age group" do
       @mastersman3445to54.race_eligible(@man335).should be_false
    end
    it "should return true when a master's man enters a men's race in his category and a younger age group" do
      @mastersman1235to44.race_eligible(@man145).should be_true
    end
    it "should return false when a master's man enters a woman's race in his category and age group" do
      @masterswomen1235plus.race_eligible(@man145).should be_false
    end
    it "should return true when a master's woman enters a women's race in her category and age group" do
      @masterswomen3435plus.race_eligible(@woman344).should be_true
    end
    it "should return folse when a master's woman enters a women's race in her category and an older age group" do
       @masterswomen1245plus.race_eligible(@woman135).should be_false
    end
    it "should return true when a master's woman enters a women's race in her category and a younger age group" do
      @masterswomen1235plus.race_eligible(@woman145).should be_true
    end
    it "should return true when a master's woman enters a man's race in her category and age group" do
      @mastersmen1235plus.race_eligible(@woman135).should be_true
    end
    it "should return true when a master's woman enters a men's race in her category and up to 10 years older" do
      @mastersmen1245to54.race_eligible(@woman135).should be_true
    end
    it "should return true when a master's woman category 3 or 4 enters a men's race in her category and up to 20 years older" do
      @mastersmen34555to100.race_eligible(@woman335).should be_true
    end
    it "should return false when a master's woman category 3 or 4 enters a men's race in her category more than 20 years older" do
      @mastersmen1234556to100.race_eligible(@woman335).should be_false
    end
    it "should return false when a master's woman category 1 or 2 enters a men's race in her category more than 10 years older" do
      @mastersmen1255to100.race_eligible(@woman135).should be_false
    end
    it "should return true when a youth enters a youth race" do
      youth.race_eligible(youth7).should be_true
    end
    it "should return true when a female youth enters a youth race" do
      youth.race_eligible(youth8).should be_true
    end
    it "should return false when a youth enters a juniors race" do
      @juniormen1214to16.race_eligible(youth8).should be_false
    end
    it "should return false when a youth enters a seniors race" do
      @srwomen1.race_eligible(youth8).should be_false
    end
    it "should return false when a youth enters a master's race" do
      @mastersmen1235to44.race_eligible(youth7).should be_false
    end
  end
end

