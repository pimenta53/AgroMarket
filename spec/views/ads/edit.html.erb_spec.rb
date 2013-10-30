require 'spec_helper'

describe "ads/edit" do
  before(:each) do
    @ad = assign(:ad, stub_model(Ad,
      :title => "MyString",
      :description => "MyString",
      :price => 1.5,
      :location => "MyString",
      :is_active => "",
      :type_price_id => 1,
      :city_id => 1
    ))
  end

  it "renders the edit ad form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ad_path(@ad), "post" do
      assert_select "input#ad_title[name=?]", "ad[title]"
      assert_select "input#ad_description[name=?]", "ad[description]"
      assert_select "input#ad_price[name=?]", "ad[price]"
      assert_select "input#ad_location[name=?]", "ad[location]"
      assert_select "input#ad_is_active[name=?]", "ad[is_active]"
      assert_select "input#ad_type_price_id[name=?]", "ad[type_price_id]"
      assert_select "input#ad_city_id[name=?]", "ad[city_id]"
    end
  end
end
