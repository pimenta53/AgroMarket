require 'spec_helper'

describe "cities/edit" do
  before(:each) do
    @city = assign(:city, stub_model(City,
      :city => "MyString",
      :district_id => 1
    ))
  end

  it "renders the edit city form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", city_path(@city), "post" do
      assert_select "input#city_city[name=?]", "city[city]"
      assert_select "input#city_district_id[name=?]", "city[district_id]"
    end
  end
end
