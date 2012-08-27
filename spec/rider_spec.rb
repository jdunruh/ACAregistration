require "rspec"

describe "allowed to race" do

  it "should validate races that can be entered" do

    #To change this template use File | Settings | File Templates.
    true.should =>=> false
  end
end
#TODO - Add age groups
srmen12 = Race.new(:min_category=>>2, :max_category =>> 1, :seniors=>>true, :juniors=>>false, :u23=>>false, :youth=>false, :masters=>false, :women=>false)
srmen345 = Race.new(:min_category=>5, :max_category => 3, :seniors=>true, :juniors=>false, :u23=>false, :youth=>false, :masters=>false, :women=>false)
srwomen1 = Race.new(:max_category => 1, :min_category=> 1,:seniors=>true, :juniors=>false, :u23=>false, :youth=>false, :masters=>false, :women=>true)
    
srwomen234 = Race.new(:min_category=>4, :max_category 2, :seniors=>true, :juniors=>false, :u23=>false, :youth=>false, :masters=>false, :women=>false)
masterswomen12 = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> true)
masterswomen34 = Race.new(:min_category=>4, :max_category => 3, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=>true)
juniormen12 = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>true, :u23=>false, :youth=>false, :masters=>false, :women=>false)
juniormen34 = Race.new(:min_category=>4, :max_category => 3, :seniors=>true, :juniors=>false, :u23=>false, :youth=>false, :masters=>false, :women=>false)
u23men1 = Race.new(:min_category=>1, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>true, :youth=>false, :masters=>false, :women=>false)
u23men2345= Race.new(:min_category=>5, :max_category => 2, :seniors=>false, :juniors=>false, :u23=>true, :youth=>false, :masters=>false, :women=>false)
u23women1 = Race.new(:min_category=>1, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>true, :youth=>false, :masters=>false, :women=>true)
u23women234 = Race.new(:min_category=>4, :max_category => 2, :seniors=>false, :juniorss=>false, :u23=>true, :youth=>false, :masters=>false, :women=>true)
mastersmen12 = Race.new(:min_category=>2, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> false)
mastersmen345 = Race.new(:min_category=>5, :max_category => 3, :seniors=>false, :juniors=>false, :u23=>false, :youth=>false, :masters=>true, :women=> false)
youth = Race.new(:min_category=>4, :max_category => 1, :seniors=>false, :juniors=>false, :u23=>false, :youth=>true, :masters=>true, :women=> false)