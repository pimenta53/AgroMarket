require 'spec_helper'

describe "plams/edit" do
  before(:each) do
    @plam = assign(:plam, stub_model(Plam,
      :name => "MyString",
      :duration => "",
      :price => 1.5,
      :ads_limit => "",
      :event_limit => ""
    ))
  end

  it "renders the edit plam form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", plam_path(@plam), "post" do
      assert_select "input#plam_name[name=?]", "plam[name]"
      assert_select "input#plam_duration[name=?]", "plam[duration]"
      assert_select "input#plam_price[name=?]", "plam[price]"
      assert_select "input#plam_ads_limit[name=?]", "plam[ads_limit]"
      assert_select "input#plam_event_limit[name=?]", "plam[event_limit]"
    end
  end
end
