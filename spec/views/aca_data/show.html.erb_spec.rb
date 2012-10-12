require 'spec_helper'

describe "aca_data/show" do
  before(:each) do
    @aca_datum = assign(:aca_datum, stub_model(AcaDatum,
      :aca_number => 1,
      :usac_number => 2,
      :has_transponder => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
  end
end
