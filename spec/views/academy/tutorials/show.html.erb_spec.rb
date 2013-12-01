require 'spec_helper'

describe "academy/tutorials/show" do
  before(:each) do
    @academy_tutorial = assign(:academy_tutorial, stub_model(Academy::Tutorial,
      :category_id => 1,
      :user_id => 2,
      :aproved => 3,
      :title => "Title",
      :text => "Text",
      :is_delected => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Title/)
    rendered.should match(/Text/)
    rendered.should match(/4/)
  end
end
