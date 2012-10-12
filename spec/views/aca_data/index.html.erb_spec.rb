require 'spec_helper'

describe "aca_data/index" do
  before(:each) do
    assign(:aca_data, [
      stub_model(AcaDatum,
        :aca_number => 1,
        :usac_number => 2,
        :has_transponder => false
      ),
      stub_model(AcaDatum,
        :aca_number => 1,
        :usac_number => 2,
        :has_transponder => false
      )
    ])
  end

  it "renders a list of aca_data" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
