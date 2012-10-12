require 'spec_helper'

describe "aca_data/new" do
  before(:each) do
    assign(:aca_datum, stub_model(AcaDatum,
      :aca_number => 1,
      :usac_number => 1,
      :has_transponder => false
    ).as_new_record)
  end

  it "renders new aca_datum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => aca_data_path, :method => "post" do
      assert_select "input#aca_datum_aca_number", :name => "aca_datum[aca_number]"
      assert_select "input#aca_datum_usac_number", :name => "aca_datum[usac_number]"
      assert_select "input#aca_datum_has_transponder", :name => "aca_datum[has_transponder]"
    end
  end
end
